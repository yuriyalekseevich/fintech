import 'package:fintech/core/presentation/pages/not_found_page.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/core/router/deep_link_security.dart';
import 'package:fintech/core/router/router_page_transitions.dart';
import 'package:fintech/features/transactions/presentation/pages/transaction_details_page.dart';
import 'package:fintech/features/transactions/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Full-screen transaction flows on the root navigator (modal).
abstract final class TransactionRoutes {
  static GoRoute list({
    required GlobalKey<NavigatorState> parentNavigatorKey,
  }) =>
      GoRoute(
        path: AppRoutes.transactions,
        name: 'transactions',
        parentNavigatorKey: parentNavigatorKey,
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
            parentNavigatorKey: parentNavigatorKey,
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
      );
}
