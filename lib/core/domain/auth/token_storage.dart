/// Persists authentication tokens. Implemented in core; consumed by interceptors
/// and the auth feature (login / logout).
abstract interface class TokenStorage {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<void> clearTokens();

  Future<bool> hasValidSession();
}
