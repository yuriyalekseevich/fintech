/// Native MethodChannel for simulator/APNs tap payloads (iOS [AppDelegate]).
///
/// Permission prompts are handled by [flutter_local_notifications] in Dart.
abstract final class NotificationChannel {
  static const String name = 'com.example.fintech/notifications';

  static const String onNotificationOpened = 'onNotificationOpened';

  static const String getPendingNotificationPayload =
      'getPendingNotificationPayload';
}
