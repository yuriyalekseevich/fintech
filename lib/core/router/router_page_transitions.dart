import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Full-screen modal-style slide for transactions flow (root navigator).
CustomTransitionPage<void> modalSlideUpPage({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      final Animation<Offset> offsetAnimation = Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
      );

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
