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

    # Install as early as possible, before CameraApp performs startup work.
    invoke-static {p1}, Lcom/pairip/CrashDiagnostics;->install(Landroid/content/Context;)V

    invoke-super {p0, p1}, Lcom/google/android/apps/camera/legacy/app/app/CameraApp;->attachBaseContext(Landroid/content/Context;)V

    # CameraApp may replace the default uncaught-exception handler.
    invoke-static {p1}, Lcom/pairip/CrashDiagnostics;->install(Landroid/content/Context;)V

    # Keep signature integrity verification unchanged.
    invoke-static {p1}, Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V

    return-void
.end method

.method public onCreate()V
    .locals 1

    # Register the report callback BEFORE CameraApp.onCreate().
    # If CameraApp initialization throws, the next Activity launch can still
    # surface the persisted report instead of losing the diagnostic UI hook.
    invoke-static {p0}, Lcom/pairip/CrashDiagnostics;->install(Landroid/content/Context;)V

    new-instance v0, Lcom/pairip/CrashDiagnostics$LifecycleCallbacks;
    invoke-direct {v0}, Lcom/pairip/CrashDiagnostics$LifecycleCallbacks;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    invoke-super {p0}, Lcom/google/android/apps/camera/legacy/app/app/CameraApp;->onCreate()V

    # Reinstall in case CameraApp replaced the handler during onCreate.
    invoke-static {p0}, Lcom/pairip/CrashDiagnostics;->install(Landroid/content/Context;)V

    return-void
.end method
