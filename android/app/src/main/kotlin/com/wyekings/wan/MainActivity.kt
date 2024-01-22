package com.wyekings.wan

import io.flutter.embedding.android.FlutterActivity
import androidx.core.splashscreen.SplashScreen
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import android.os.Bundle

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        val splashScreen = installSplashScreen().apply { setKeepOnScreenCondition { true } }
        super.onCreate(savedInstanceState)
        window.decorView.post { splashScreen.setKeepOnScreenCondition { false } }
    }
}
