import 'package:fintech/core/presentation/pages/not_found_page.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/core/router/deep_link_security.dart';
import 'package:fintech/features/accounts/presentation/pages/account_details_page.dart';
import 'package:fintech/features/accounts/presentation/pages/accounts_page.dart';
import 'package:fintech/features/accounts/presentation/pages/add_account_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Accounts tab branch inside [StatefulShellRoute].
abstract final class AccountRoutes {
  static StatefulShellBranch branch({
    required GlobalKey<NavigatorState> navigatorKey,
  }) =>
      StatefulShellBranch(
        navigatorKey: navigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.accounts,
            name: 'accounts',
            builder: (BuildContext context, GoRouterState state) {
              return const AccountsPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                name: 'addAccount',
                builder: (BuildContext context, GoRouterState state) {
                  return const AddAccountPage();
                },
              ),
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
      );
}
