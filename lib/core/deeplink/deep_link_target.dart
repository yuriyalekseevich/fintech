/// Parsed deeplink destination consumed by [DeepLinkCoordinator].
sealed class DeepLinkTarget {
  const DeepLinkTarget();
}

/// Opens transaction details with back stack: profile → transactions → details.
final class TransactionDetailsDeepLink extends DeepLinkTarget {
  const TransactionDetailsDeepLink(this.transactionId);

  final String transactionId;
}

/// Opens card details with back stack: cards tab → details.
final class CardDetailsDeepLink extends DeepLinkTarget {
  const CardDetailsDeepLink(this.cardId);

  final String cardId;
}

/// Opens account details with back stack: accounts tab → details.
final class AccountDetailsDeepLink extends DeepLinkTarget {
  const AccountDetailsDeepLink(this.accountId);

  final String accountId;
}
