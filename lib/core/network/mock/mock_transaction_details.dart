/// Mock transaction detail payloads keyed by id (registry only).
abstract final class MockTransactionDetails {
  static Map<String, Object> forId(String id) {
    return switch (id) {
      'tx-1' => <String, Object>{
          'id': 'tx-1',
          'title': 'Coffee Shop',
          'amount': -4.50,
          'currency': 'USD',
          'date': '2026-05-24',
          'category': 'Food & Drink',
          'status': 'completed',
          'merchant': 'Blue Bottle Coffee',
          'reference': 'REF-20260524-001',
          'description':
              'Card purchase at Blue Bottle Coffee, downtown branch.',
        },
      'tx-2' => <String, Object>{
          'id': 'tx-2',
          'title': 'Salary deposit',
          'amount': 3200.00,
          'currency': 'USD',
          'date': '2026-05-22',
          'category': 'Income',
          'status': 'completed',
          'merchant': 'Acme Corp Payroll',
          'reference': 'REF-20260522-884',
          'description': 'Monthly salary deposit from employer.',
        },
      '219850' || 'tx-219850' => <String, Object>{
          'id': id,
          'title': 'Transfer',
          'amount': -219850.00,
          'currency': 'EUR',
          'date': '2026-05-25',
          'category': 'Transfer',
          'status': 'completed',
          'merchant': 'SEPA Transfer',
          'reference': 'REF-219850',
          'description': 'Transfer for €219,850 from push notification.',
        },
      _ => <String, Object>{
          'id': id,
          'title': 'Unknown transaction',
          'amount': 0.0,
          'currency': 'USD',
          'date': '2026-05-25',
          'category': 'Other',
          'status': 'completed',
          'merchant': 'N/A',
          'reference': 'REF-$id',
          'description': 'No additional details available for this transaction.',
        },
    };
  }

  static const List<Map<String, Object>> transactionsList = <Map<String, Object>>[
    <String, Object>{
      'id': 'tx-1',
      'title': 'Coffee Shop',
      'amount': -4.50,
      'date': '2026-05-24',
    },
    <String, Object>{
      'id': 'tx-2',
      'title': 'Salary deposit',
      'amount': 3200.00,
      'date': '2026-05-22',
    },
    <String, Object>{
      'id': '219850',
      'title': 'Transfer',
      'amount': -219850.00,
      'date': '2026-05-25',
    },
  ];
}
