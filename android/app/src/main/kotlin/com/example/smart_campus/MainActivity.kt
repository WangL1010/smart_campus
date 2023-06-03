package com.example.smart_campus

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.webviewflutter.InAppWebViewFlutterPlugin;

class MainActivity: FlutterActivity() {

    @Override
    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine?) {
        super.configureFlutterEngine(flutterEngine)
        InAppWebViewFlutterPlugin.registerWith(flutterEngine)
    }
}
