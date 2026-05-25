/// Base failure type for domain and presentation layers.
///
/// Features extend this with feature-specific failures while reusing
/// [NetworkFailure], [StorageFailure], and [UnexpectedFailure].
sealed class Failure {
  const Failure();

  String get message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure({
    required this.message,
    this.statusCode,
  });

  @override
  final String message;

  final int? statusCode;
}

final class StorageFailure extends Failure {
  const StorageFailure({required this.message, this.cause});

  @override
  final String message;

  final Object? cause;
}

final class AuthFailure extends Failure {
  const AuthFailure({required this.message});

  @override
  final String message;
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required this.message, this.cause});

  @override
  final String message;

  final Object? cause;
}
