import 'package:fintech/core/network/mock/mock_card_details.dart';

/// In-memory card data for mock POST/DELETE. Not used outside mock layer.
final class MockCardsStore {
  MockCardsStore._() {
    for (final Map<String, Object> summary in MockCardDetails.cardsList) {
      final String id = summary['id']! as String;
      _summaries.add(Map<String, Object>.from(summary));
      _details[id] = Map<String, Object>.from(MockCardDetails.forId(id));
    }
  }

  static final MockCardsStore instance = MockCardsStore._();

  final List<Map<String, Object>> _summaries = <Map<String, Object>>[];
  final Map<String, Map<String, Object>> _details = <String, Map<String, Object>>{};
  int _idCounter = 100;

  List<Map<String, Object>> get summaries =>
      List<Map<String, Object>>.unmodifiable(_summaries);

  Map<String, Object>? detailsFor(String id) => _details[id];

  Map<String, Object> createFromBody(Map<String, dynamic> body) {
    final String id = 'card-${_idCounter++}';
    final String cardNumber = body['cardNumber']! as String;
    final String last4 = cardNumber.length >= 4
        ? cardNumber.substring(cardNumber.length - 4)
        : cardNumber;
    final String brand = body['brand']! as String;
    final String type = body['type']! as String;
    final String holderName = body['holderName']! as String;
    final String expiryMonth = body['expiryMonth']! as String;
    final String expiryYear = body['expiryYear']! as String;
    final String yearSuffix = expiryYear.length >= 2
        ? expiryYear.substring(expiryYear.length - 2)
        : expiryYear;
    final String currency = body['currency']! as String;

    final Map<String, Object> summary = <String, Object>{
      'id': id,
      'last4': last4,
      'brand': brand,
      'type': type,
    };

    final Map<String, Object> details = <String, Object>{
      'id': id,
      'last4': last4,
      'brand': brand,
      'type': type,
      'holderName': holderName,
      'expiryDate': '$expiryMonth/$yearSuffix',
      'status': 'active',
      'dailyLimit': 2500.0,
      'currency': currency,
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
