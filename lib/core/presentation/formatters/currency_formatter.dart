/// Formats ISO 4217 currency codes for UI (mock app — fixed symbol map).
abstract final class CurrencyFormatter {
  static String symbol(String currencyCode) {
    return switch (currencyCode.toUpperCase()) {
      'USD' => '\$',
      'EUR' => '€',
      'TRY' => '₺',
      _ => currencyCode,
    };
  }

  static String formatAmount({
    required double amount,
    required String currencyCode,
  }) {
    return '${symbol(currencyCode)}${amount.toStringAsFixed(2)}';
  }
}
