import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/core/network/interceptors/logging_interceptor.dart';
import 'package:fintech/core/network/mock/mock_response_registry.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:injectable/injectable.dart';

/// Builds base [Dio] clients with mock adapter. Interceptors are attached in [NetworkModule].
@lazySingleton
class DioClientFactory {
  DioClientFactory(this._loggingInterceptor);

  final LoggingInterceptor _loggingInterceptor;

  Dio createBaseClient() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    final DioAdapter adapter = DioAdapter(dio: dio);
    MockResponseRegistry.register(adapter);
    dio.interceptors.add(_loggingInterceptor);

    return dio;
  }
}
