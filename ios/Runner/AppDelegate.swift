import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let notificationChannelName = "com.example.fintech/notifications"
  private var notificationChannel: FlutterMethodChannel?
  private var pendingNotificationPayload: [String: Any]?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let didFinish = super.application(application, didFinishLaunchingWithOptions: launchOptions)

    if let controller = window?.rootViewController as? FlutterViewController {
      notificationChannel = FlutterMethodChannel(
        name: notificationChannelName,
        binaryMessenger: controller.binaryMessenger
      )
      setupNotificationChannel()
    }

    // Foreground banners + simulator/APNs tap → Flutter (permissions via flutter_local_notifications).
    UNUserNotificationCenter.current().delegate = self

    if let userInfo = launchOptions?[.remoteNotification] as? [AnyHashable: Any] {
      pendingNotificationPayload = payloadDictionary(from: userInfo)
      NSLog("[Push] buffered launch notification")
    }

    return didFinish
  }

  private func setupNotificationChannel() {
    notificationChannel?.setMethodCallHandler { [weak self] call, result in
      guard let self = self else {
        result(FlutterMethodNotImplemented)
        return
      }

      switch call.method {
      case "getPendingNotificationPayload":
        result(self.pendingNotificationPayload)
        self.pendingNotificationPayload = nil
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    if #available(iOS 14.0, *) {
      completionHandler([.banner, .sound, .badge])
    } else {
      completionHandler([.alert, .sound, .badge])
    }
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    forwardNotificationPayload(response.notification.request.content.userInfo)
    completionHandler()
  }

  private func forwardNotificationPayload(_ userInfo: [AnyHashable: Any]) {
    let payload = payloadDictionary(from: userInfo)
    guard !payload.isEmpty else {
      return
    }

    guard let channel = notificationChannel else {
      pendingNotificationPayload = payload
      return
    }

    channel.invokeMethod("onNotificationOpened", arguments: payload) { [weak self] error in
      if error != nil {
        self?.pendingNotificationPayload = payload
      }
    }
  }

  private func payloadDictionary(from userInfo: [AnyHashable: Any]) -> [String: Any] {
    var payload: [String: Any] = [:]
    for (key, value) in userInfo {
      if let key = key as? String {
        payload[key] = value
      }
    }
    return payload
  }
}
