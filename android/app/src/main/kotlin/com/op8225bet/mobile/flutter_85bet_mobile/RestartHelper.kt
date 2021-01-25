package com.opv79.mobile

import android.content.Context
import android.content.Intent
import kotlin.system.exitProcess

object RestartHelper {
    fun restart(ctx: Context) {
        val packageManager = ctx.packageManager
        val intent = packageManager.getLaunchIntentForPackage(ctx.packageName)
        val componentName = intent!!.component
        val mainIntent = Intent.makeRestartActivityTask(componentName)
        ctx.startActivity(mainIntent)
        exitProcess(0)
    }
}
