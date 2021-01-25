import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // flutter channel
    // static const _rotationChannel = const MethodChannel('com.opvking88.mobile/orientation');
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let rotationChannel = FlutterMethodChannel(
        name: "com.opvking88.mobile/orientation",
        binaryMessenger: controller.binaryMessenger)

    // flutter call (call SystemChrome.setPreferredOrientation before invoke)
    // _rotationChannel.invokeMethod('setLandscapeLeft');
    // _rotationChannel.invokeMethod('setLandscapeRight');
    // _rotationChannel.invokeMethod('setPortrait');
    rotationChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method.hasPrefix("set") == true else {
        print("error method name")
        return
      }

      if "setLandscapeRight" == call.method {
        UIDevice.current.setValue(NSNumber(value: UIInterfaceOrientation.landscapeRight.rawValue), forKey: "orientation")
      } else if "setLandscapeLeft" == call.method {
        UIDevice.current.setValue(NSNumber(value: UIInterfaceOrientation.landscapeLeft.rawValue), forKey: "orientation")
      }  else if "setPortrait" == call.method {
        UIDevice.current.setValue(NSNumber(value: UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
