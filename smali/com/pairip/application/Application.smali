.class public Lcom/pairip/application/Application;
.super Lcom/google/android/apps/camera/legacy/app/app/CameraApp;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/apps/camera/legacy/app/app/CameraApp;-><init>()V

    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 0

    # Install before superclass initialization so startup failures are persisted.
    invoke-static {p1}, Lcom/pairip/CrashDiagnostics;->install(Landroid/content/Context;)V

    # Call the actual parent implementation. Calling Application->attachBaseContext
    # here points back to this class and can fail ART verification at process start.
    invoke-super {p0, p1}, Lcom/google/android/apps/camera/legacy/app/app/CameraApp;->attachBaseContext(Landroid/content/Context;)V

    # CameraApp initialization may replace the default uncaught handler.
    invoke-static {p1}, Lcom/pairip/CrashDiagnostics;->install(Landroid/content/Context;)V

    # Keep the existing signature integrity check enabled.
    invoke-static {p1}, Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V

    return-void
.end method

.method public onCreate()V
    .locals 1

    invoke-super {p0}, Lcom/google/android/apps/camera/legacy/app/app/CameraApp;->onCreate()V

    # Reinstall after CameraApp startup and show any report from an earlier launch.
    invoke-static {p0}, Lcom/pairip/CrashDiagnostics;->install(Landroid/content/Context;)V

    new-instance v0, Lcom/pairip/CrashDiagnostics$LifecycleCallbacks;
    invoke-direct {v0}, Lcom/pairip/CrashDiagnostics$LifecycleCallbacks;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
