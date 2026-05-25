import 'package:dio/dio.dart';
import 'package:fintech/core/domain/auth/token_refresher.dart';
import 'package:fintech/core/domain/auth/token_storage.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:injectable/injectable.dart';

/// Default [TokenRefresher] used by [AuthInterceptor] until auth feature overrides it.
@LazySingleton(as: TokenRefresher)
class TokenRefreshService implements TokenRefresher {
  TokenRefreshService(
    @Named('auth') this._dio,
    this._tokenStorage,
  );

  final Dio _dio;
  final TokenStorage _tokenStorage;

  @override
  Future<Result<void>> refresh() async {
    try {
      final String? refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        return const Error<void>(
          AuthFailure(message: 'No refresh token available'),
        );
      }

      final Response<Map<String, Object?>> response =
          await _dio.post<Map<String, Object?>>(
        ApiEndpoints.refreshToken,
        data: <String, String>{'refreshToken': refreshToken},
      );

      final Map<String, Object?>? data = response.data;
      final String? accessToken = data?['accessToken'] as String?;
      final String? newRefreshToken = data?['refreshToken'] as String?;

      if (accessToken == null || newRefreshToken == null) {
        return const Error<void>(
          AuthFailure(message: 'Invalid refresh token response'),
        );
      }

      await _tokenStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: newRefreshToken,
      );

      return const Success<void>(null);
    } on DioException catch (error) {
      return Error<void>(
        NetworkFailure(
          message: error.message ?? 'Token refresh failed',
          statusCode: error.response?.statusCode,
        ),
      );
    } on Object catch (error) {
      return Error<void>(
        UnexpectedFailure(
          message: 'Token refresh failed unexpectedly',
          cause: error,
        ),
      );
    }
  }
}
