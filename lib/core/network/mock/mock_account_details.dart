/// Mock account detail payloads keyed by id (registry only).
abstract final class MockAccountDetails {
  static Map<String, Object> forId(String id) {
    return switch (id) {
      'acc-usd' => <String, Object>{
          'id': 'acc-usd',
          'name': 'US Dollar Checking',
          'balance': 8420.00,
          'currency': 'USD',
          'iban': 'US12 3456 7890 1234 5678',
          'accountType': 'checking',
          'status': 'active',
        },
      'acc-eur' => <String, Object>{
          'id': 'acc-eur',
          'name': 'Euro Savings',
          'balance': 12500.50,
          'currency': 'EUR',
          'iban': 'DE89 3704 0044 0532 0130 00',
          'accountType': 'savings',
          'status': 'active',
        },
      'acc-try' => <String, Object>{
          'id': 'acc-try',
          'name': 'Turkish Lira Account',
          'balance': 485000.00,
          'currency': 'TRY',
          'iban': 'TR33 0006 1005 1978 6457 8413 26',
          'accountType': 'current',
          'status': 'active',
        },
      _ => <String, Object>{
          'id': id,
          'name': 'Unknown account',
          'balance': 0.0,
          'currency': 'USD',
          'iban': 'N/A',
          'accountType': 'checking',
          'status': 'active',
        },
    };
  }

  static const List<Map<String, Object>> accountsList = <Map<String, Object>>[
    <String, Object>{
      'id': 'acc-usd',
      'name': 'US Dollar Checking',
      'balance': 8420.00,
      'currency': 'USD',
    },
    <String, Object>{
      'id': 'acc-eur',
      'name': 'Euro Savings',
      'balance': 12500.50,
      'currency': 'EUR',
    },
    <String, Object>{
      'id': 'acc-try',
      'name': 'Turkish Lira Account',
      'balance': 485000.00,
      'currency': 'TRY',
    },
  ];
}
