import 'package:fintech/core/domain/supported_currency.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/validation_result.dart';

/// Input for issuing a new card. Validation runs in [CreateCardRequest.create].
final class CreateCardRequest {
  const CreateCardRequest._({
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
    required this.holderName,
    required this.addressLine1,
    required this.addressLine2,
    required this.state,
    required this.zipCode,
    required this.currency,
    required this.brand,
    required this.type,
  });

  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final String cvv;
  final String holderName;
  final String addressLine1;
  final String addressLine2;
  final String state;
  final String zipCode;
  final SupportedCurrency currency;
  final String brand;
  final String type;

  static const int _minCardLength = 13;
  static const int _maxCardLength = 19;
  static const int _maxNameLength = 80;
  static const int _maxAddressLength = 100;
  static const int _maxStateLength = 50;
  static const int _maxFutureYears = 20;

  static const Set<String> _usStateCodes = <String>{
    'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA',
    'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD',
    'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ',
    'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC',
    'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY',
    'DC',
  };

  static ValidationResult<CreateCardRequest> create({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvv,
    required String holderName,
    required String addressLine1,
    String? addressLine2,
    required String state,
    required String zipCode,
    required String currency,
    String type = 'debit',
  }) {
    final Map<String, String> errors = <String, String>{};

    final String digits = _digitsOnly(cardNumber);
    final String? cardError = _validateCardNumber(digits);
    if (cardError != null) {
      errors['cardNumber'] = cardError;
    }

    final String? expiryError = _validateExpiry(expiryMonth, expiryYear);
    if (expiryError != null) {
      errors['expiry'] = expiryError;
    }

    final String detectedBrand =
        digits.isNotEmpty ? _detectBrand(digits) : 'Unknown';
    final String? cvvError = _validateCvv(cvv, detectedBrand);
    if (cvvError != null) {
      errors['cvv'] = cvvError;
    }

    final String trimmedHolder = holderName.trim();
    if (trimmedHolder.isEmpty) {
      errors['holderName'] = 'Enter the cardholder name';
    } else if (trimmedHolder.length > _maxNameLength) {
      errors['holderName'] = 'Name is too long';
    }

    final String trimmedLine1 = addressLine1.trim();
    if (trimmedLine1.isEmpty) {
      errors['addressLine1'] = 'Enter address line 1';
    } else if (trimmedLine1.length > _maxAddressLength) {
      errors['addressLine1'] = 'Address is too long';
    }

    final String trimmedLine2 = (addressLine2 ?? '').trim();
    if (trimmedLine2.length > _maxAddressLength) {
      errors['addressLine2'] = 'Address is too long';
    }

    final String trimmedState = state.trim().toUpperCase();
    if (trimmedState.isEmpty) {
      errors['state'] = 'Enter state';
    } else if (trimmedState.length == 2) {
      if (!_usStateCodes.contains(trimmedState)) {
        errors['state'] = 'Enter a valid US state code';
      }
    } else if (trimmedState.length > _maxStateLength) {
      errors['state'] = 'State is too long';
    }

    final String? zipError = _validateZipCode(zipCode);
    if (zipError != null) {
      errors['zipCode'] = zipError;
    }

    final SupportedCurrency? parsedCurrency = SupportedCurrency.tryParse(currency);
    if (parsedCurrency == null) {
      errors['currency'] = 'Select a supported currency';
    }

    final String normalizedType = type.trim().toLowerCase();
    if (normalizedType != 'debit' && normalizedType != 'credit') {
      errors['type'] = 'Invalid card type';
    }

    if (errors.isNotEmpty) {
      return Invalid<CreateCardRequest>(
        ValidationFailure(
          message: 'Please fix the highlighted fields',
          fieldErrors: errors,
        ),
      );
    }

    final int month = int.parse(expiryMonth.trim());
    final int year = _normalizeYear(expiryYear.trim());

    return Valid<CreateCardRequest>(
      CreateCardRequest._(
        cardNumber: digits,
        expiryMonth: month.toString().padLeft(2, '0'),
        expiryYear: year.toString(),
        cvv: cvv.trim(),
        holderName: trimmedHolder,
        addressLine1: trimmedLine1,
        addressLine2: trimmedLine2,
        state: trimmedState,
        zipCode: _normalizeZip(zipCode),
        currency: parsedCurrency!,
        brand: detectedBrand,
        type: normalizedType,
      ),
    );
  }

  /// UI validators delegate here so rules stay in one place.
  static String? validateCardNumberField(String? value) =>
      _validateCardNumber(_digitsOnly(value ?? ''));

  static String? validateExpiryField(String? month, String? year) =>
      _validateExpiry(month ?? '', year ?? '');

  static String? validateCvvField(String? value, String brand) =>
      _validateCvv(value ?? '', brand);

  static String? validateHolderNameField(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.isEmpty) {
      return 'Enter the cardholder name';
    }
    if (trimmed.length > _maxNameLength) {
      return 'Name is too long';
    }
    return null;
  }

  static String? validateAddressLine1Field(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.isEmpty) {
      return 'Enter address line 1';
    }
    if (trimmed.length > _maxAddressLength) {
      return 'Address is too long';
    }
    return null;
  }

  static String? validateAddressLine2Field(String? value) {
    final String trimmed = (value ?? '').trim();
    if (trimmed.length > _maxAddressLength) {
      return 'Address is too long';
    }
    return null;
  }

  static String? validateStateField(String? value) {
    final String trimmed = (value ?? '').trim().toUpperCase();
    if (trimmed.isEmpty) {
      return 'Enter state';
    }
    if (trimmed.length == 2 && !_usStateCodes.contains(trimmed)) {
      return 'Enter a valid US state code';
    }
    if (trimmed.length > _maxStateLength) {
      return 'State is too long';
    }
    return null;
  }

  static String? validateZipCodeField(String? value) => _validateZipCode(value ?? '');

  String get last4 =>
      cardNumber.length >= 4 ? cardNumber.substring(cardNumber.length - 4) : cardNumber;

  String get expiryDate => '$expiryMonth/${expiryYear.substring(2)}';

  static String _digitsOnly(String input) =>
      input.replaceAll(RegExp(r'\D'), '');

  static String _normalizeZip(String zip) {
    final String trimmed = zip.trim();
    if (RegExp(r'^\d{5}$').hasMatch(trimmed)) {
      return trimmed;
    }
    return trimmed;
  }

  static int _normalizeYear(String year) {
    if (year.length == 2) {
      return 2000 + int.parse(year);
    }
    return int.parse(year);
  }

  static String? _validateCardNumber(String digits) {
    if (digits.isEmpty) {
      return 'Enter card number';
    }
    if (digits.length < _minCardLength || digits.length > _maxCardLength) {
      return 'Enter a valid card number';
    }
    if (!_luhnValid(digits)) {
      return 'Invalid card number';
    }
    return null;
  }

  static String? _validateExpiry(String monthRaw, String yearRaw) {
    final String monthStr = monthRaw.trim();
    final String yearStr = yearRaw.trim();
    if (monthStr.isEmpty || yearStr.isEmpty) {
      return 'Enter expiry date';
    }

    final int? month = int.tryParse(monthStr);
    if (month == null || month < 1 || month > 12) {
      return 'Enter a valid month (01–12)';
    }

    final int? year = int.tryParse(
      yearStr.length == 2 ? '20$yearStr' : yearStr,
    );
    if (year == null) {
      return 'Enter a valid year';
    }

    final DateTime now = DateTime.now();
    if (year < now.year || (year == now.year && month < now.month)) {
      return 'Card has expired';
    }

    if (year > now.year + _maxFutureYears ||
        (year == now.year + _maxFutureYears && month > now.month)) {
      return 'Expiry date is too far in the future';
    }

    return null;
  }

  static String? _validateCvv(String cvv, String brand) {
    final String trimmed = cvv.trim();
    if (trimmed.isEmpty) {
      return 'Enter CVV';
    }
    final int expectedLength = brand == 'Amex' ? 4 : 3;
    if (!RegExp(r'^\d+$').hasMatch(trimmed) || trimmed.length != expectedLength) {
      return brand == 'Amex' ? 'Enter 4-digit CVV' : 'Enter 3-digit CVV';
    }
    return null;
  }

  static String? _validateZipCode(String zip) {
    final String trimmed = zip.trim();
    if (trimmed.isEmpty) {
      return 'Enter ZIP code';
    }
    if (!RegExp(r'^\d{5}(-\d{4})?$').hasMatch(trimmed)) {
      return 'Enter a valid US ZIP code';
    }
    return null;
  }

  static bool _luhnValid(String digits) {
    int sum = 0;
    bool alternate = false;
    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = digits.codeUnitAt(i) - 48;
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  static String _detectBrand(String digits) {
    if (digits.startsWith('4')) {
      return 'Visa';
    }
    if (RegExp(r'^3[47]').hasMatch(digits)) {
      return 'Amex';
    }
    if (RegExp(r'^5[1-5]').hasMatch(digits) ||
        (digits.length >= 4 &&
            int.parse(digits.substring(0, 4)) >= 2221 &&
            int.parse(digits.substring(0, 4)) <= 2720)) {
      return 'Mastercard';
    }
    return 'Unknown';
  }
}
