import 'package:fintech/core/domain/validation_result.dart';
import 'package:fintech/features/cards/domain/requests/create_card_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String validPayload = '4242424242424242';

  CreateCardRequest validRequest() {
    final ValidationResult<CreateCardRequest> result = CreateCardRequest.create(
      cardNumber: validPayload,
      expiryMonth: '12',
      expiryYear: '30',
      cvv: '123',
      holderName: 'Alex Morgan',
      addressLine1: '123 Main St',
      addressLine2: '',
      state: 'NY',
      zipCode: '10001',
      currency: 'USD',
    );
    expect(result, isA<Valid<CreateCardRequest>>());
    return (result as Valid<CreateCardRequest>).value;
  }

  group('CreateCardRequest', () {
    test('accepts valid card data', () {
      final CreateCardRequest request = validRequest();
      expect(request.last4, '4242');
      expect(request.brand, 'Visa');
      expect(request.currency.code, 'USD');
    });

    test('rejects invalid Luhn card number', () {
      final ValidationResult<CreateCardRequest> result = CreateCardRequest.create(
        cardNumber: '4242424242424241',
        expiryMonth: '12',
        expiryYear: '30',
        cvv: '123',
        holderName: 'Alex Morgan',
        addressLine1: '123 Main St',
        state: 'NY',
        zipCode: '10001',
        currency: 'USD',
      );
      expect(result, isA<Invalid<CreateCardRequest>>());
      expect(
        (result as Invalid<CreateCardRequest>).failure.fieldErrors['cardNumber'],
        isNotNull,
      );
    });

    test('rejects expired card', () {
      final ValidationResult<CreateCardRequest> result = CreateCardRequest.create(
        cardNumber: validPayload,
        expiryMonth: '01',
        expiryYear: '20',
        cvv: '123',
        holderName: 'Alex Morgan',
        addressLine1: '123 Main St',
        state: 'NY',
        zipCode: '10001',
        currency: 'USD',
      );
      expect(result, isA<Invalid<CreateCardRequest>>());
      expect(
        (result as Invalid<CreateCardRequest>).failure.fieldErrors['expiry'],
        isNotNull,
      );
    });

    test('rejects invalid US state code', () {
      final ValidationResult<CreateCardRequest> result = CreateCardRequest.create(
        cardNumber: validPayload,
        expiryMonth: '12',
        expiryYear: '30',
        cvv: '123',
        holderName: 'Alex Morgan',
        addressLine1: '123 Main St',
        state: 'XX',
        zipCode: '10001',
        currency: 'USD',
      );
      expect(result, isA<Invalid<CreateCardRequest>>());
      expect(
        (result as Invalid<CreateCardRequest>).failure.fieldErrors['state'],
        isNotNull,
      );
    });

    test('rejects unsupported currency', () {
      final ValidationResult<CreateCardRequest> result = CreateCardRequest.create(
        cardNumber: validPayload,
        expiryMonth: '12',
        expiryYear: '30',
        cvv: '123',
        holderName: 'Alex Morgan',
        addressLine1: '123 Main St',
        state: 'NY',
        zipCode: '10001',
        currency: 'GBP',
      );
      expect(result, isA<Invalid<CreateCardRequest>>());
      expect(
        (result as Invalid<CreateCardRequest>).failure.fieldErrors['currency'],
        isNotNull,
      );
    });
  });
}
