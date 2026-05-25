/// Validates deeplink path parameters before navigation (finTech-safe allowlist).
abstract final class DeepLinkSecurity {
  static final RegExp resourceIdPattern = RegExp(r'^[a-zA-Z0-9_-]{1,64}$');

  static bool isValidResourceId(String id) => resourceIdPattern.hasMatch(id);

  static bool isValidTransactionId(String id) => isValidResourceId(id);

  static bool isValidCardId(String id) => isValidResourceId(id);

  static bool isValidAccountId(String id) => isValidResourceId(id);
}
