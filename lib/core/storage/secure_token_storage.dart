import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fintech/core/domain/auth/token_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TokenStorage)
class SecureTokenStorage implements TokenStorage {
  SecureTokenStorage(this._storage);

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _storage;

  @override
  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);

  @override
  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait<void>([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  @override
  Future<void> clearTokens() async {
    await Future.wait<void>([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }

  @override
  Future<bool> hasValidSession() async {
    final String? access = await getAccessToken();
    return access != null && access.isNotEmpty;
  }
}
