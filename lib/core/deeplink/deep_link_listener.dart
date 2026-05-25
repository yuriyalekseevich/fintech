import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:fintech/core/deeplink/deep_link_coordinator.dart';
import 'package:injectable/injectable.dart';

/// Listens to universal / app links ([app_links]). Push taps use [NotificationService].
@lazySingleton
class DeepLinkListener {
  DeepLinkListener(this._coordinator);

  final DeepLinkCoordinator _coordinator;
  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _uriSubscription;

  @disposeMethod
  Future<void> dispose() async {
    await _uriSubscription?.cancel();
  }

  Future<void> initialize() async {
    final Uri? initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      await _coordinator.handleUri(initialUri);
    }

    _uriSubscription = _appLinks.uriLinkStream.listen(_coordinator.handleUri);
  }
}
