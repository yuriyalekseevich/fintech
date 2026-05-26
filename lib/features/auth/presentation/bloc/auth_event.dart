sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLoginSubmitted extends AuthEvent {
  const AuthLoginSubmitted({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  String toString() =>
      'AuthLoginSubmitted(email: $email, password: ***redacted***)';
}

final class AuthSessionRestored extends AuthEvent {
  const AuthSessionRestored();
}

/// Fired when another feature (e.g. profile logout) clears [AuthSession].
final class AuthLoggedOutExternally extends AuthEvent {
  const AuthLoggedOutExternally();
}
