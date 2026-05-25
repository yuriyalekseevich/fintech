import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/features/auth/infrastructure/dtos/auth_tokens_dto.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthTokensDto> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(@Named('api') this._dio);

  final Dio _dio;

  @override
  Future<AuthTokensDto> login({
    required String email,
    required String password,
  }) async {
    final Response<Map<String, Object?>> response =
        await _dio.post<Map<String, Object?>>(
      ApiEndpoints.login,
      data: <String, String>{
        'email': email,
        'password': password,
      },
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty login response',
        type: DioExceptionType.badResponse,
      );
    }

    return AuthTokensDto.fromJson(data);
  }

  @override
  Future<void> logout() async {
    await _dio.post<void>(ApiEndpoints.logout);
  }
}
