import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// Logs route changes in debug; swap implementation for Firebase/Amplitude later.
@lazySingleton
class RouteAnalyticsObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logScreenView(route, 'push');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      _logScreenView(previousRoute, 'pop');
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _logScreenView(newRoute, 'replace');
    }
  }

  void _logScreenView(Route<dynamic> route, String action) {
    if (!kDebugMode) {
      return;
    }

    final String name = route.settings.name ?? route.settings.toString();
    debugPrint('[Analytics] screen_view ($action): $name');
  }
}
