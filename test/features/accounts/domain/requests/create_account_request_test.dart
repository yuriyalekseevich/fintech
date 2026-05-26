import 'package:fintech/core/domain/validation_result.dart';
import 'package:fintech/features/accounts/domain/requests/create_account_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreateAccountRequest', () {
    test('accepts valid account data', () {
      final ValidationResult<CreateAccountRequest> result =
          CreateAccountRequest.create(
        name: 'Travel Fund',
        currency: 'EUR',
        accountType: 'savings',
        initialBalance: '100.50',
      );

      expect(result, isA<Valid<CreateAccountRequest>>());
      final CreateAccountRequest request =
          (result as Valid<CreateAccountRequest>).value;
      expect(request.name, 'Travel Fund');
      expect(request.currency.code, 'EUR');
      expect(request.initialBalance, 100.50);
    });

    test('rejects empty name', () {
      final ValidationResult<CreateAccountRequest> result =
          CreateAccountRequest.create(
        name: ' ',
        currency: 'USD',
        accountType: 'checking',
      );

      expect(result, isA<Invalid<CreateAccountRequest>>());
      expect(
        (result as Invalid<CreateAccountRequest>).failure.fieldErrors['name'],
        isNotNull,
      );
    });

    test('rejects invalid account type', () {
      final ValidationResult<CreateAccountRequest> result =
          CreateAccountRequest.create(
        name: 'My Account',
        currency: 'USD',
        accountType: 'brokerage',
      );

      expect(result, isA<Invalid<CreateAccountRequest>>());
      expect(
        (result as Invalid<CreateAccountRequest>)
            .failure
            .fieldErrors['accountType'],
        isNotNull,
      );
    });

    test('rejects negative initial balance', () {
      final ValidationResult<CreateAccountRequest> result =
          CreateAccountRequest.create(
        name: 'My Account',
        currency: 'USD',
        accountType: 'checking',
        initialBalance: '-1',
      );

      expect(result, isA<Invalid<CreateAccountRequest>>());
      expect(
        (result as Invalid<CreateAccountRequest>)
            .failure
            .fieldErrors['initialBalance'],
        isNotNull,
      );
    });
  });
}
