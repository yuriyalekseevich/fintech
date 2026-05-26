import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Profile tab branch inside [StatefulShellRoute].
abstract final class ProfileRoutes {
  static StatefulShellBranch branch({
    required GlobalKey<NavigatorState> navigatorKey,
  }) =>
      StatefulShellBranch(
        navigatorKey: navigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.profile,
            name: 'profile',
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
        ],
      );
}
