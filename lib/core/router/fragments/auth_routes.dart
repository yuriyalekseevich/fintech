import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Authentication routes (outside the main shell).
abstract final class AuthRoutes {
  static GoRoute login({
    required GlobalKey<NavigatorState> parentNavigatorKey,
  }) =>
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        parentNavigatorKey: parentNavigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      );
}
