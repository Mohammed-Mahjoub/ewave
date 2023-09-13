import UIKit
import Flutter
import Firebase


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    FirebaseApp.configure() //add this before the code below
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
//     FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
//           GeneratedPluginRegistrant.register(with: registry)
//         }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}
