/// Route path constants for [GoRouter]. Features import these — not each other.
abstract final class AppRoutes {
  static const String login = '/login';

  static const String shell = '/';
  static const String dashboard = '/dashboard';
  static const String cards = '/cards';
  static const String cardDetailsParam = 'cardId';

  static String cardDetails(String cardId) => '/cards/$cardId';

  static const String accounts = '/accounts';
  static const String accountDetailsParam = 'accountId';

  static String accountDetails(String accountId) => '/accounts/$accountId';
  static const String profile = '/profile';

  static const String transactions = '/transactions';
  static const String transactionDetailsParam = 'transactionId';

  static String transactionDetails(String transactionId) =>
      '/transactions/$transactionId';
}
