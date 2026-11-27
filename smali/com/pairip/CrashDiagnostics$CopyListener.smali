.class public final Lcom/pairip/CrashDiagnostics$CopyListener;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;

.field private final activity:Landroid/app/Activity;
.field private final report:Ljava/lang/String;
.field private final reportFile:Ljava/io/File;

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/pairip/CrashDiagnostics$CopyListener;->activity:Landroid/app/Activity;
    iput-object p2, p0, Lcom/pairip/CrashDiagnostics$CopyListener;->report:Ljava/lang/String;
    iput-object p3, p0, Lcom/pairip/CrashDiagnostics$CopyListener;->reportFile:Ljava/io/File;
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    iget-object v0, p0, Lcom/pairip/CrashDiagnostics$CopyListener;->activity:Landroid/app/Activity;
    const-string v1, "clipboard"
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/content/ClipboardManager;

    const-string v2, "GCam crash report"
    iget-object v3, p0, Lcom/pairip/CrashDiagnostics$CopyListener;->report:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    iget-object v1, p0, Lcom/pairip/CrashDiagnostics$CopyListener;->reportFile:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    const-string v1, "Crash report copied to clipboard"
    const/4 v2, 0x0
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v1
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    return-void
.end method
