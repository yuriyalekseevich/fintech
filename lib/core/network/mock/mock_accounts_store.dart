import 'package:fintech/core/network/mock/mock_account_details.dart';

/// In-memory account data for mock POST/DELETE. Not used outside mock layer.
final class MockAccountsStore {
  MockAccountsStore._() {
    for (final Map<String, Object> summary in MockAccountDetails.accountsList) {
      final String id = summary['id']! as String;
      _summaries.add(Map<String, Object>.from(summary));
      _details[id] = Map<String, Object>.from(MockAccountDetails.forId(id));
    }
  }

  static final MockAccountsStore instance = MockAccountsStore._();

  final List<Map<String, Object>> _summaries = <Map<String, Object>>[];
  final Map<String, Map<String, Object>> _details =
      <String, Map<String, Object>>{};
  int _idCounter = 100;

  List<Map<String, Object>> get summaries =>
      List<Map<String, Object>>.unmodifiable(_summaries);

  Map<String, Object>? detailsFor(String id) => _details[id];

  Map<String, Object> createFromBody(Map<String, dynamic> body) {
    final String id = 'acc-${_idCounter++}';
    final String name = body['name']! as String;
    final String currency = body['currency']! as String;
    final String accountType = body['accountType']! as String;
    final double balance = (body['initialBalance'] as num?)?.toDouble() ?? 0.0;

    final Map<String, Object> summary = <String, Object>{
      'id': id,
      'name': name,
      'balance': balance,
      'currency': currency,
    };

    final Map<String, Object> details = <String, Object>{
      'id': id,
      'name': name,
      'balance': balance,
      'currency': currency,
      'iban': 'MOCK ${currency} ${id.toUpperCase()}',
      'accountType': accountType,
      'status': 'active',
    };

    _summaries.add(summary);
    _details[id] = details;
    return summary;
  }

  bool deleteById(String id) {
    final int index = _summaries.indexWhere(
      (Map<String, Object> e) => e['id'] == id,
    );
    if (index < 0) {
      return false;
    }
    _summaries.removeAt(index);
    _details.remove(id);
    return true;
  }
}
