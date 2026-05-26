import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Dashboard tab branch inside [StatefulShellRoute].
abstract final class DashboardRoutes {
  static StatefulShellBranch branch({
    required GlobalKey<NavigatorState> navigatorKey,
  }) =>
      StatefulShellBranch(
        navigatorKey: navigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.dashboard,
            name: 'dashboard',
            builder: (BuildContext context, GoRouterState state) {
              return const DashboardPage();
            },
          ),
        ],
      );
}
