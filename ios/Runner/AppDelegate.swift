import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let callChannel = FlutterMethodChannel(name: "in.aayaninfotech.southwaltoncarts_customer/call", binaryMessenger: controller.binaryMessenger)
    GeneratedPluginRegistrant.register(with: self)
     callChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                 if call.method == "callNumber" {
                     if let args = call.arguments as? [String: Any],
                        let phoneNumber = args["phoneNumber"] as? String {
                         print("Phone call requested with number: \(phoneNumber)")
                         self.makePhoneCall(phoneNumber: phoneNumber)
                         result(nil)
                     } else {
                         print("Error: Phone number not provided")
                         result(FlutterError(code: "ERROR", message: "Phone number not provided", details: nil))
                     }
                 } else {
                     print("Error: Method not implemented")
                     result(FlutterMethodNotImplemented)
                 }
             }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func makePhoneCall(phoneNumber: String) {
          print("Method channel invoked with phone number: \(phoneNumber)");

              if let url = URL(string: "tel://\(phoneNumber)") {
                UIApplication.shared.open(url)
              }
            }



}
