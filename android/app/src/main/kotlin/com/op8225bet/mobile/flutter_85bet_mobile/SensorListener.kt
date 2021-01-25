package com.opv79.mobile

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.view.OrientationEventListener
import android.view.Surface
import io.flutter.plugin.common.EventChannel
import kotlin.math.atan2
import kotlin.math.roundToInt

/**
 *
 * @author H.C.CHIANG
 * @version 2020/3/19
 */
class SensorListener(private val sensorManager: SensorManager) :
    EventChannel.StreamHandler, SensorEventListener {
    private var eventSink: EventChannel.EventSink? = null

    private var mLastAccuracy = 0
    private var mLastOrientation = 0
    private var mDeviceOrientation = 0

    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
        this.eventSink = events
        registerIfActive()
    }

    override fun onCancel(arguments: Any?) {
        unregisterIfActive()
        eventSink = null
    }

    override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {
        if (mLastAccuracy != accuracy)
            mLastAccuracy = accuracy
    }

    override fun onSensorChanged(event: SensorEvent) {
        if (mLastAccuracy == SensorManager.SENSOR_STATUS_UNRELIABLE)
            return

        val result = computeAngle(event.values)
        if (result != mLastOrientation)
            updateOrientation(result, eventSink)
    }

    /**
     * Compute rotate angle
     */
    private fun computeAngle(rotationVector: FloatArray): Int {
        var orientation = OrientationEventListener.ORIENTATION_UNKNOWN
        val x = -rotationVector[DATA_X]
        val y = -rotationVector[DATA_Y]
        val z = -rotationVector[DATA_Z]
        val magnitude = x * x + y * y
        // Don't trust the angle if the magnitude is small compared to the y value
        if (magnitude * 4 >= z * z) {
            val oneEightyOverPi = 57.29577957855f
            val angle = atan2(
                -y.toDouble(),
                x.toDouble()
            ).toFloat() * oneEightyOverPi
            orientation = 90 - angle.roundToInt()
            // normalize to 0 - 359 range
            while (orientation >= 360) {
                orientation -= 360
            }
            while (orientation < 0) {
                orientation += 360
            }
        }
        return orientation;
    }

    /**
     * Get screen rotate index by rotate angle
     */
    private fun updateOrientation(arg0: Int, events: EventChannel.EventSink?) {
        mLastOrientation = arg0
//        println("rotate angle: $arg0")

        val rotateTo = when (arg0) {
            in 45..134 -> Surface.ROTATION_180
            in 135..224 -> Surface.ROTATION_270
            in 225..314 -> Surface.ROTATION_0
            in 0..44, in 315..360 -> Surface.ROTATION_90
            else -> -1
        }

//            0 -> ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
//            2 -> ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE
//            3 -> ActivityInfo.SCREEN_ORIENTATION_REVERSE_PORTRAIT
//            else -> ActivityInfo.SCREEN_ORIENTATION_PORTRAIT

        if (mDeviceOrientation == rotateTo || rotateTo == -1) return
        mDeviceOrientation = rotateTo
        events?.success(mDeviceOrientation)
    }

    // Lifecycle methods.
    fun registerIfActive() {
        if (eventSink == null) return
        sensorManager.registerListener(
            this,
            sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER),
            SENSOR_DELAY_MICROS
        )
    }

    fun unregisterIfActive() {
        if (eventSink == null) return
        sensorManager.unregisterListener(this)
    }

    companion object {
        internal const val CHANNEL_NAME = "com.opv79.mobile/sensor"
        private const val DATA_X = 0
        private const val DATA_Y = 1
        private const val DATA_Z = 2
        // Orientation Sensor, SENSOR_DELAY_NORMAL: 224-225 ms
        private const val SENSOR_DELAY_MICROS = 1000 * 1000 * 10
    }
}