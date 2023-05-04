package com.example.myapp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "myapp/initHaptic").setMethodCallHandler {
            call, result ->
            if(call.method == "initHelpCentre") {
                println("called")
                try {
                    MyApplication.launchCustomSignupConversation()
                } catch(e: Exception) {
                    println(e)
                }
            } else {
                result.notImplemented()
            }
        }

    }
}
