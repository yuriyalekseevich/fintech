import 'package:dio/dio.dart';
import 'package:fintech/core/domain/auth/token_storage.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/network/dio_failure_mapper.dart';
import 'package:fintech/features/auth/domain/entities/auth_tokens.dart';
import 'package:fintech/features/auth/domain/repositories/auth_repository.dart';
import 'package:fintech/features/auth/infrastructure/datasources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._remoteDataSource,
    this._tokenStorage,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final TokenStorage _tokenStorage;

  @override
  Future<Result<AuthTokens>> login({
    required String email,
    required String password,
  }) async {
    try {
      final tokensDto = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      final AuthTokens tokens = tokensDto.toDomain();

      await _tokenStorage.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );

      return Success<AuthTokens>(tokens);
    } on DioException catch (error) {
      return Error<AuthTokens>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<AuthTokens>(
        UnexpectedFailure(
          message: 'Login failed unexpectedly',
          cause: error,
        ),
      );
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _remoteDataSource.logout();
    } on DioException {
      // Best-effort remote logout; always clear local session.
    } on Object {
      // Best-effort remote logout.
    }

    try {
      await _tokenStorage.clearTokens();
      return const Success<void>(null);
    } on Object catch (error) {
      return Error<void>(
        StorageFailure(
          message: 'Failed to clear session',
          cause: error,
        ),
      );
    }
  }
}
