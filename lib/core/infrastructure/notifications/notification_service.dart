import 'dart:convert';

import 'package:fintech/core/deeplink/deep_link_coordinator.dart';
import 'package:fintech/core/infrastructure/notifications/notification_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

/// Push + permissions: [FlutterLocalNotificationsPlugin] for the system prompt,
/// native MethodChannel for simulator/APNs payload forwarding (see [AppDelegate]).
@lazySingleton
class NotificationService {
  NotificationService(this._coordinator);

  final DeepLinkCoordinator _coordinator;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const MethodChannel _nativeChannel =
      MethodChannel(NotificationChannel.name);

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    await _initializeLocalNotifications();
    await _requestPlatformPermissions();
    _nativeChannel.setMethodCallHandler(_onNativeMethodCall);
    await _drainNativePendingPayload();

    _isInitialized = true;
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: _onLocalNotificationResponse,
    );
  }

  /// Shows the OS permission dialog (iOS / Android 13+).
  Future<void> _requestPlatformPermissions() async {
    final bool? iosGranted = await _localNotifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    final bool? androidGranted = await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (kDebugMode) {
      debugPrint(
        '[NotificationService] permissions — iOS: $iosGranted, Android: $androidGranted',
      );
    }
  }

  void _onLocalNotificationResponse(NotificationResponse response) {
    final Map<String, Object?>? payload = _parsePayloadString(response.payload);
    if (payload == null) {
      return;
    }
    _handlePayload(payload);
  }

  Future<void> _onNativeMethodCall(MethodCall call) async {
    if (call.method != NotificationChannel.onNotificationOpened) {
      return;
    }

    final Object? arguments = call.arguments;
    if (arguments is! Map<Object?, Object?>) {
      return;
    }

    await _handlePayload(_normalizeMap(arguments));
  }

  Future<void> _drainNativePendingPayload() async {
    try {
      final Object? result = await _nativeChannel.invokeMethod<Object?>(
        NotificationChannel.getPendingNotificationPayload,
      );

      if (result is Map<Object?, Object?>) {
        await _handlePayload(_normalizeMap(result));
      }
    } on PlatformException catch (error) {
      if (kDebugMode) {
        debugPrint('[NotificationService] drain pending failed: $error');
      }
    } on MissingPluginException {
      // Tests / desktop without native host.
    }
  }

  Future<void> _handlePayload(Map<String, Object?> payload) async {
    await _coordinator.handleNotificationPayload(payload);
  }

  Map<String, Object?>? _parsePayloadString(String? payload) {
    if (payload == null || payload.isEmpty) {
      return null;
    }

    try {
      final Object? decoded = jsonDecode(payload);
      if (decoded is Map<String, Object?>) {
        return decoded;
      }
      if (decoded is Map) {
        return _normalizeMap(decoded);
      }
    } on Object {
      // Not JSON — ignore.
    }
    return null;
  }

  Map<String, Object?> _normalizeMap(Map<Object?, Object?> raw) {
    return Map<String, Object?>.fromEntries(
      raw.entries.map(
        (MapEntry<Object?, Object?> entry) =>
            MapEntry(entry.key.toString(), entry.value),
      ),
    );
  }
}
