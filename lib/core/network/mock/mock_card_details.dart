/// Mock card detail payloads keyed by id (registry only).
abstract final class MockCardDetails {
  static Map<String, Object> forId(String id) {
    return switch (id) {
      'card-1' => <String, Object>{
          'id': 'card-1',
          'last4': '4242',
          'brand': 'Visa',
          'type': 'debit',
          'holderName': 'Alex Morgan',
          'expiryDate': '09/28',
          'status': 'active',
          'dailyLimit': 2500.00,
          'currency': 'USD',
        },
      'card-2' => <String, Object>{
          'id': 'card-2',
          'last4': '5555',
          'brand': 'Mastercard',
          'type': 'credit',
          'holderName': 'Alex Morgan',
          'expiryDate': '03/27',
          'status': 'active',
          'dailyLimit': 5000.00,
          'currency': 'USD',
        },
      'card-3' => <String, Object>{
          'id': 'card-3',
          'last4': '1234',
          'brand': 'Visa',
          'type': 'credit',
          'holderName': 'Alex Morgan',
          'expiryDate': '11/29',
          'status': 'active',
          'dailyLimit': 3000.00,
          'currency': 'EUR',
        },
      'card-4' => <String, Object>{
          'id': 'card-4',
          'last4': '9876',
          'brand': 'Amex',
          'type': 'debit',
          'holderName': 'Alex Morgan',
          'expiryDate': '06/26',
          'status': 'frozen',
          'dailyLimit': 1500.00,
          'currency': 'TRY',
        },
      _ => <String, Object>{
          'id': id,
          'last4': '0000',
          'brand': 'Unknown',
          'type': 'debit',
          'holderName': 'Alex Morgan',
          'expiryDate': '01/30',
          'status': 'active',
          'dailyLimit': 0.0,
          'currency': 'USD',
        },
    };
  }

  static const List<Map<String, Object>> cardsList = <Map<String, Object>>[
    <String, Object>{
      'id': 'card-1',
      'last4': '4242',
      'brand': 'Visa',
      'type': 'debit',
    },
    <String, Object>{
      'id': 'card-2',
      'last4': '5555',
      'brand': 'Mastercard',
      'type': 'credit',
    },
    <String, Object>{
      'id': 'card-3',
      'last4': '1234',
      'brand': 'Visa',
      'type': 'credit',
    },
    <String, Object>{
      'id': 'card-4',
      'last4': '9876',
      'brand': 'Amex',
      'type': 'debit',
    },
  ];
}
