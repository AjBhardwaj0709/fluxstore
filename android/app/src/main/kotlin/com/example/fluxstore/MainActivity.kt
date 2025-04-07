package com.example.fluxstore

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity(){
      private val CHANNEL = "screenshot_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "allowScreenshots") {
                window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                result.success("Screenshots allowed")
            } else {
                result.notImplemented()
            }
        }
}
}
