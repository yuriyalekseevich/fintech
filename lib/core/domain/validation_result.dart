import 'package:fintech/core/domain/failure.dart';

/// Result of validating a domain request before it is constructed.
sealed class ValidationResult<T> {
  const ValidationResult();
}

final class Valid<T> extends ValidationResult<T> {
  const Valid(this.value);

  final T value;
}

final class Invalid<T> extends ValidationResult<T> {
  const Invalid(this.failure);

  final ValidationFailure failure;
}
