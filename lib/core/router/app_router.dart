import 'package:fintech/core/deeplink/pending_deep_link_store.dart';
import 'package:fintech/core/domain/auth/auth_session.dart';
import 'package:fintech/core/presentation/pages/not_found_page.dart';
import 'package:fintech/core/presentation/shell/main_shell.dart';
import 'package:fintech/core/router/deep_link_security.dart';
import 'package:fintech/core/router/route_analytics_observer.dart';
import 'package:fintech/core/router/router_page_transitions.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/accounts/presentation/pages/account_details_page.dart';
import 'package:fintech/features/accounts/presentation/pages/accounts_page.dart';
import 'package:fintech/features/auth/presentation/pages/login_page.dart';
import 'package:fintech/features/cards/presentation/pages/card_details_page.dart';
import 'package:fintech/features/cards/presentation/pages/cards_page.dart';
import 'package:fintech/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:fintech/features/profile/presentation/pages/profile_page.dart';
import 'package:fintech/features/transactions/presentation/pages/transaction_details_page.dart';
import 'package:fintech/features/transactions/presentation/pages/transactions_page.dart';
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
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        parentNavigatorKey: rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
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
          StatefulShellBranch(
            navigatorKey: dashboardNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.dashboard,
                name: 'dashboard',
                builder: (BuildContext context, GoRouterState state) {
                  return const DashboardPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: cardsNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.cards,
                name: 'cards',
                builder: (BuildContext context, GoRouterState state) {
                  return const CardsPage();
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: ':${AppRoutes.cardDetailsParam}',
                    name: 'cardDetails',
                    builder: (BuildContext context, GoRouterState state) {
                      final String? cardId =
                          state.pathParameters[AppRoutes.cardDetailsParam];

                      if (cardId == null ||
                          !DeepLinkSecurity.isValidCardId(cardId)) {
                        return const NotFoundPage();
                      }

                      return CardDetailsPage(cardId: cardId);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: accountsNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.accounts,
                name: 'accounts',
                builder: (BuildContext context, GoRouterState state) {
                  return const AccountsPage();
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: ':${AppRoutes.accountDetailsParam}',
                    name: 'accountDetails',
                    builder: (BuildContext context, GoRouterState state) {
                      final String? accountId =
                          state.pathParameters[AppRoutes.accountDetailsParam];

                      if (accountId == null ||
                          !DeepLinkSecurity.isValidAccountId(accountId)) {
                        return const NotFoundPage();
                      }

                      return AccountDetailsPage(accountId: accountId);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.profile,
                name: 'profile',
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfilePage();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.transactions,
        name: 'transactions',
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return modalSlideUpPage(
            state: state,
            child: const TransactionsPage(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: ':${AppRoutes.transactionDetailsParam}',
            name: 'transactionDetails',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              final String? transactionId =
                  state.pathParameters[AppRoutes.transactionDetailsParam];

              if (transactionId == null ||
                  !DeepLinkSecurity.isValidTransactionId(transactionId)) {
                return modalSlideUpPage(
                  state: state,
                  child: const NotFoundPage(),
                );
              }

              return modalSlideUpPage(
                state: state,
                child: TransactionDetailsPage(transactionId: transactionId),
              );
            },
          ),
        ],
      ),
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
