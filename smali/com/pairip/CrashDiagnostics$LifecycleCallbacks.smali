.class public final Lcom/pairip/CrashDiagnostics$LifecycleCallbacks;
.super Ljava/lang/Object;
.implements Landroid/app/Application$ActivityLifecycleCallbacks;

.field private reportShown:Z

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    iget-boolean v0, p0, Lcom/pairip/CrashDiagnostics$LifecycleCallbacks;->reportShown:Z
    if-nez v0, :done

    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/pairip/CrashDiagnostics$LifecycleCallbacks;->reportShown:Z

    invoke-static {p1}, Lcom/pairip/CrashDiagnostics;->showIfPending(Landroid/app/Activity;)V

    :done
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    return-void
.end method
