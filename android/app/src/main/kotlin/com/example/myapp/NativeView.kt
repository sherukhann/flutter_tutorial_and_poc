package com.example.myapp

import android.content.Context
import android.graphics.Color
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView
import android.view.View

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        textView = TextView(context)
        textView.textSize = 22f
        textView.setBackgroundColor(Color.rgb(0, 0, 0))
        textView.text = "Rendered on a native s Android view (id: $id)"
        textView.setTextColor(Color.RED)
    }
}
