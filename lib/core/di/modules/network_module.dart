import 'package:dio/dio.dart';
import 'package:fintech/core/network/dio_client_factory.dart';
import 'package:fintech/core/network/interceptors/auth_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  /// Auth-only client (refresh calls). No [AuthInterceptor] to avoid recursion.
  @lazySingleton
  @Named('auth')
  Dio authDio(DioClientFactory factory) => factory.createBaseClient();

  /// Primary API client with auth queue + token attachment.
  @lazySingleton
  @Named('api')
  Dio apiDio(DioClientFactory factory, AuthInterceptor authInterceptor) {
    final Dio dio = factory.createBaseClient();
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
