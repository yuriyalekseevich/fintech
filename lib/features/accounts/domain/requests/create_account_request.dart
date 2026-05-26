import 'package:fintech/core/domain/supported_currency.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/validation_result.dart';

/// Input for opening a new account. Validation runs in [CreateAccountRequest.create].
final class CreateAccountRequest {
  const CreateAccountRequest._({
    required this.name,
    required this.currency,
    required this.accountType,
    required this.initialBalance,
  });

  final String name;
  final SupportedCurrency currency;
  final String accountType;
  final double initialBalance;

  static const int _minNameLength = 2;
  static const int _maxNameLength = 80;
  static const double _maxInitialBalance = 999999999.99;

  static const Set<String> _accountTypes = <String>{
    'checking',
    'savings',
    'current',
  };

  static ValidationResult<CreateAccountRequest> create({
    required String name,
    required String currency,
    required String accountType,
    String? initialBalance,
  }) {
    final Map<String, String> errors = <String, String>{};

    final String trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      errors['name'] = 'Enter account name';
    } else if (trimmedName.length < _minNameLength) {
      errors['name'] = 'Name must be at least $_minNameLength characters';
    } else if (trimmedName.length > _maxNameLength) {
      errors['name'] = 'Name is too long';
    }

    final SupportedCurrency? parsedCurrency = SupportedCurrency.tryParse(currency);
    if (parsedCurrency == null) {
      errors['currency'] = 'Select a supported currency';
    }

    final String normalizedType = accountType.trim().toLowerCase();
    if (!_accountTypes.contains(normalizedType)) {
      errors['accountType'] = 'Select an account type';
    }

    double balance = 0;
    final String balanceRaw = (initialBalance ?? '').trim();
    if (balanceRaw.isNotEmpty) {
      final double? parsed = double.tryParse(balanceRaw);
      if (parsed == null) {
        errors['initialBalance'] = 'Enter a valid amount';
      } else if (parsed < 0) {
        errors['initialBalance'] = 'Balance cannot be negative';
      } else if (parsed > _maxInitialBalance) {
        errors['initialBalance'] = 'Amount is too large';
      } else {
        balance = parsed;
      }
    }

    if (errors.isNotEmpty) {
      return Invalid<CreateAccountRequest>(
        ValidationFailure(
          message: 'Please fix the highlighted fields',
          fieldErrors: errors,
        ),
      );
    }

    return Valid<CreateAccountRequest>(
      CreateAccountRequest._(
        name: trimmedName,
        currency: parsedCurrency!,
        accountType: normalizedType,
        initialBalance: balance,
      ),
    );
  }

  static String? validateNameField(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.isEmpty) {
      return 'Enter account name';
    }
    if (trimmed.length < _minNameLength) {
      return 'Name must be at least $_minNameLength characters';
    }
    if (trimmed.length > _maxNameLength) {
      return 'Name is too long';
    }
    return null;
  }

  static String? validateInitialBalanceField(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.isEmpty) {
      return null;
    }
    final double? parsed = double.tryParse(trimmed);
    if (parsed == null) {
      return 'Enter a valid amount';
    }
    if (parsed < 0) {
      return 'Balance cannot be negative';
    }
    if (parsed > _maxInitialBalance) {
      return 'Amount is too large';
    }
    return null;
  }
}
