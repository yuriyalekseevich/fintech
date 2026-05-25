import 'package:fintech/core/deeplink/deep_link_target.dart';
import 'package:fintech/core/router/app_router.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:injectable/injectable.dart';

abstract interface class DeepLinkNavigator {
  Future<void> navigate(DeepLinkTarget target);
}

/// Builds navigation stacks required for correct Android/iOS back behavior.
@LazySingleton(as: DeepLinkNavigator)
class GoRouterDeepLinkNavigator implements DeepLinkNavigator {
  GoRouterDeepLinkNavigator(this._appRouter);

  final AppRouter _appRouter;

  @override
  Future<void> navigate(DeepLinkTarget target) async {
    switch (target) {
      case TransactionDetailsDeepLink(:final transactionId):
        await _openTransactionDetailsStack(transactionId);
      case CardDetailsDeepLink(:final cardId):
        await _openCardDetailsStack(cardId);
      case AccountDetailsDeepLink(:final accountId):
        await _openAccountDetailsStack(accountId);
    }
  }

  /// Stack: profile (shell) → transactions → details.
  Future<void> _openTransactionDetailsStack(String transactionId) async {
    final router = _appRouter.router;
    router.go(AppRoutes.profile);
    await Future<void>.delayed(Duration.zero);
    router.push(AppRoutes.transactions);
    router.push(AppRoutes.transactionDetails(transactionId));
  }

  /// Stack: cards tab → details.
  Future<void> _openCardDetailsStack(String cardId) async {
    final router = _appRouter.router;
    router.go(AppRoutes.cards);
    await Future<void>.delayed(Duration.zero);
    router.push(AppRoutes.cardDetails(cardId));
  }

  /// Stack: accounts tab → details.
  Future<void> _openAccountDetailsStack(String accountId) async {
    final router = _appRouter.router;
    router.go(AppRoutes.accounts);
    await Future<void>.delayed(Duration.zero);
    router.push(AppRoutes.accountDetails(accountId));
  }
}
