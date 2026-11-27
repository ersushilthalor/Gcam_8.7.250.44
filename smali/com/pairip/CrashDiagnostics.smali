.class public final Lcom/pairip/CrashDiagnostics;
.super Ljava/lang/Object;

.field public static final CRASH_FILE:Ljava/lang/String; = "gcam-last-crash.txt"

.method private constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static install(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;
    move-result-object v0

    instance-of v1, v0, Lcom/pairip/CrashDiagnostics$Handler;
    if-nez v1, :done

    new-instance v1, Lcom/pairip/CrashDiagnostics$Handler;
    invoke-direct {v1, p0, v0}, Lcom/pairip/CrashDiagnostics$Handler;-><init>(Landroid/content/Context;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    :done
    return-void
.end method

.method public static showIfPending(Landroid/app/Activity;)V
    .locals 5

    invoke-virtual {p0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0

    const-string v1, "gcam-last-crash.txt"
    invoke-virtual {p0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :done

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;
    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;
    invoke-static {v1, v2}, Ljava/nio/file/Files;->readString(Ljava/nio/file/Path;Ljava/nio/charset/Charset;)Ljava/lang/String;
    move-result-object v1

    new-instance v2, Landroid/app/AlertDialog$Builder;
    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Previous GCam crash detected"
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;
    const-string v4, "The previous launch crashed. Review the report below. Tap Copy log to share it.\n\n"
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    new-instance v3, Lcom/pairip/CrashDiagnostics$CopyListener;
    invoke-direct {v3, p0, v1, v0}, Lcom/pairip/CrashDiagnostics$CopyListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/io/File;)V

    const-string v4, "Copy log"
    invoke-virtual {v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    const-string v3, "Close"
    const/4 v4, 0x0
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v1
    const-string v2, "GCamCrashDiagnostics"
    const-string v3, "Could not show saved crash report"
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :done
    return-void
.end method
