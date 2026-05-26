/// ISO 4217 currencies supported by the app (aligned with [CurrencyFormatter]).
enum SupportedCurrency {
  usd('USD'),
  eur('EUR'),
  try_('TRY');

  const SupportedCurrency(this.code);

  final String code;

  static SupportedCurrency? tryParse(String? raw) {
    if (raw == null) {
      return null;
    }
    final String normalized = raw.trim().toUpperCase();
    for (final SupportedCurrency currency in SupportedCurrency.values) {
      if (currency.code == normalized) {
        return currency;
      }
    }
    return null;
  }

  static const List<SupportedCurrency> valuesForPicker = SupportedCurrency.values;
}
