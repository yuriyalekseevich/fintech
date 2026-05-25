import 'package:fintech/core/deeplink/pending_deep_link_store.dart';
import 'package:fintech/core/domain/auth/auth_session.dart';
import 'package:fintech/core/presentation/pages/not_found_page.dart';
import 'package:fintech/core/presentation/shell/main_shell.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/core/router/fragments/account_routes.dart';
import 'package:fintech/core/router/fragments/auth_routes.dart';
import 'package:fintech/core/router/fragments/card_routes.dart';
import 'package:fintech/core/router/fragments/dashboard_routes.dart';
import 'package:fintech/core/router/fragments/profile_routes.dart';
import 'package:fintech/core/router/fragments/transaction_routes.dart';
import 'package:fintech/core/router/route_analytics_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

/// Root navigator — full-screen flows (login, transactions, deeplinks).
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

@lazySingleton
class AppRouter {
  AppRouter(
    this._authSession,
    this._pendingDeepLinkStore,
    this._analyticsObserver,
  );

  final AuthSession _authSession;
  final PendingDeepLinkStore _pendingDeepLinkStore;
  final RouteAnalyticsObserver _analyticsObserver;

  /// Per-tab stacks — use from BLoCs via [rootNavigatorKey] / branch keys without [BuildContext].
  static final GlobalKey<NavigatorState> dashboardNavKey =
      GlobalKey<NavigatorState>(debugLabel: 'dashboardNav');

  static final GlobalKey<NavigatorState> cardsNavKey =
      GlobalKey<NavigatorState>(debugLabel: 'cardsNav');

  static final GlobalKey<NavigatorState> accountsNavKey =
      GlobalKey<NavigatorState>(debugLabel: 'accountsNav');

  static final GlobalKey<NavigatorState> profileNavKey =
      GlobalKey<NavigatorState>(debugLabel: 'profileNav');

  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.dashboard,
    refreshListenable: _authSession,
    observers: <NavigatorObserver>[_analyticsObserver],
    debugLogDiagnostics: kDebugMode,
    errorBuilder: (BuildContext context, GoRouterState state) {
      return NotFoundPage(
        key: state.pageKey,
      );
    },
    redirect: _redirect,
    routes: <RouteBase>[
      AuthRoutes.login(parentNavigatorKey: rootNavigatorKey),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          DashboardRoutes.branch(navigatorKey: dashboardNavKey),
          CardRoutes.branch(navigatorKey: cardsNavKey),
          AccountRoutes.branch(navigatorKey: accountsNavKey),
          ProfileRoutes.branch(navigatorKey: profileNavKey),
        ],
      ),
      TransactionRoutes.list(parentNavigatorKey: rootNavigatorKey),
    ],
  );

  String? _redirect(BuildContext context, GoRouterState state) {
    final bool isAuthenticated = _authSession.isAuthenticated;
    final bool isLoggingIn = state.matchedLocation == AppRoutes.login;

    if (!isAuthenticated) {
      return isLoggingIn ? null : AppRoutes.login;
    }

    if (isLoggingIn) {
      return _pendingDeepLinkStore.hasPending ? null : AppRoutes.dashboard;
    }

    return null;
  }
}
