/// Central API path constants. Mock handlers and features reference these only.
abstract final class ApiEndpoints {
  static const String baseUrl = 'https://api.mock.fintech.local';

  static const String login = '/auth/login';
  static const String refreshToken = '/auth/refresh-token';
  static const String logout = '/auth/logout';

  static const String dashboard = '/dashboard';
  static const String cards = '/cards';
  static const String accounts = '/accounts';

  static String cardDetails(String id) => '/cards/$id';
  static String accountDetails(String id) => '/accounts/$id';
  static const String profile = '/profile';
  static const String transactions = '/transactions';

  static String transactionDetails(String id) => '/transactions/$id';
}
