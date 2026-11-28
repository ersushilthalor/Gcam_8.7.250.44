#!/usr/bin/env python3
"""Set the runtime APK signature allowlist to the certificate used by CI."""
from pathlib import Path
import re
import sys

if len(sys.argv) != 2:
    raise SystemExit("Usage: set-signature-allowlist.py BASE64_SHA256")

digest = sys.argv[1].strip()
if not re.fullmatch(r"[A-Za-z0-9+/]{43}=", digest):
    raise SystemExit("Signer SHA-256 must be a padded Base64 digest")

path = Path("smali_classes2/com/pairip/SignatureCheck.smali")
source = path.read_text(encoding="utf-8")
pattern = re.compile(
    r'(?m)^\.field private static expectedSignature:Ljava/lang/String; = "[^"]*"$'
)
replacement = (
    '.field private static expectedSignature:Ljava/lang/String; = "'
    + digest
    + '"'
)
updated, count = pattern.subn(replacement, source)
if count != 1:
    raise SystemExit(f"Expected one expectedSignature field; found {count}")
path.write_text(updated, encoding="utf-8")
print("Configured runtime signature verification for this CI signing certificate.")
