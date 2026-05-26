/// Domain tokens returned after a successful authentication.
final class AuthTokens {
  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  @override
  String toString() =>
      'AuthTokens(accessToken: ***, refreshToken: ***, expiresIn: $expiresIn)';
}
