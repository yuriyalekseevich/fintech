import 'package:fintech/core/presentation/pages/not_found_page.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/core/router/deep_link_security.dart';
import 'package:fintech/features/cards/presentation/pages/add_card_page.dart';
import 'package:fintech/features/cards/presentation/pages/card_details_page.dart';
import 'package:fintech/features/cards/presentation/pages/cards_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Cards tab branch inside [StatefulShellRoute].
abstract final class CardRoutes {
  static StatefulShellBranch branch({
    required GlobalKey<NavigatorState> navigatorKey,
  }) =>
      StatefulShellBranch(
        navigatorKey: navigatorKey,
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.cards,
            name: 'cards',
            builder: (BuildContext context, GoRouterState state) {
              return const CardsPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                name: 'addCard',
                builder: (BuildContext context, GoRouterState state) {
                  return const AddCardPage();
                },
              ),
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
      );
}
