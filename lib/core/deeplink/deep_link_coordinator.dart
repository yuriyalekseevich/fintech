import 'package:fintech/core/deeplink/deep_link_navigator.dart';
import 'package:fintech/core/deeplink/deep_link_parser.dart';
import 'package:fintech/core/deeplink/deep_link_target.dart';
import 'package:fintech/core/deeplink/pending_deep_link_store.dart';
import 'package:fintech/core/domain/auth/auth_session.dart';
import 'package:fintech/core/router/app_router.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeepLinkCoordinator {
  DeepLinkCoordinator(
    this._authSession,
    this._pendingStore,
    this._parser,
    this._navigator,
    this._appRouter,
  );

  final AuthSession _authSession;
  final PendingDeepLinkStore _pendingStore;
  final DeepLinkParser _parser;
  final DeepLinkNavigator _navigator;
  final AppRouter _appRouter;

  Future<void> handleUri(Uri uri) async {
    final DeepLinkTarget? target = _parser.parseUri(uri);
    if (target == null) {
      return;
    }
    await _handleTarget(target);
  }

  Future<void> handleNotificationPayload(Map<String, Object?> payload) async {
    final DeepLinkTarget? target = _parser.parseNotificationPayload(payload);
    if (target == null) {
      return;
    }
    await _handleTarget(target);
  }

  Future<void> _handleTarget(DeepLinkTarget target) async {
    if (!_authSession.isAuthenticated) {
      _pendingStore.save(target);
      _appRouter.router.go(AppRoutes.login);
      _appRouter.router.refresh();
      return;
    }
    await _navigator.navigate(target);
  }

  /// Call after successful login or restored session when a push deeplink was queued.
  Future<void> processPendingAfterAuth() async {
    if (!_authSession.isAuthenticated) {
      return;
    }
    final DeepLinkTarget? target = _pendingStore.consume();
    if (target == null) {
      return;
    }
    await _navigator.navigate(target);
  }
}
