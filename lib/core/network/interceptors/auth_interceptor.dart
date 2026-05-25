import 'package:dio/dio.dart';
import 'package:fintech/core/domain/auth/token_refresher.dart';
import 'package:fintech/core/domain/auth/token_storage.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:injectable/injectable.dart';

/// On 401: pauses the Dio queue, refreshes the token, retries queued requests.
///
/// Skips refresh for login and refresh-token endpoints to avoid infinite loops.
@lazySingleton
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    @Named('auth') required Dio dio,
    required TokenStorage tokenStorage,
    required TokenRefresher tokenRefresher,
  })  : _dio = dio,
        _tokenStorage = tokenStorage,
        _tokenRefresher = tokenRefresher;

  final Dio _dio;
  final TokenStorage _tokenStorage;
  final TokenRefresher _tokenRefresher;

  bool _isRefreshing = false;
  final List<({RequestOptions options, ErrorInterceptorHandler handler})> _queue =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_shouldAttachToken(options.path)) {
      final String? token = await _tokenStorage.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final int? statusCode = err.response?.statusCode;
    final bool isUnauthorized = statusCode == 401;
    final bool canRefresh = isUnauthorized && _shouldAttemptRefresh(err.requestOptions.path);

    if (!canRefresh) {
      handler.next(err);
      return;
    }

    _queue.add((options: err.requestOptions, handler: handler));

    if (_isRefreshing) {
      return;
    }

    _isRefreshing = true;

    final Result<void> refreshResult = await _tokenRefresher.refresh();

    if (refreshResult is Error<void>) {
      await _rejectQueue(err);
      _isRefreshing = false;
      return;
    }

    await _retryQueue();
    _isRefreshing = false;
  }

  bool _shouldAttachToken(String path) {
    return path != ApiEndpoints.login && path != ApiEndpoints.refreshToken;
  }

  bool _shouldAttemptRefresh(String path) {
    return path != ApiEndpoints.login && path != ApiEndpoints.refreshToken;
  }

  Future<void> _retryQueue() async {
    final List<({RequestOptions options, ErrorInterceptorHandler handler})> pending =
        List<({RequestOptions options, ErrorInterceptorHandler handler})>.from(_queue);
    _queue.clear();

    for (final ({RequestOptions options, ErrorInterceptorHandler handler}) item in pending) {
      try {
        final String? token = await _tokenStorage.getAccessToken();
        if (token != null) {
          item.options.headers['Authorization'] = 'Bearer $token';
        }
        final Response<Object?> response = await _dio.fetch<Object?>(item.options);
        item.handler.resolve(response);
      } on DioException catch (retryError) {
        item.handler.next(retryError);
      }
    }
  }

  Future<void> _rejectQueue(DioException original) async {
    final List<({RequestOptions options, ErrorInterceptorHandler handler})> pending =
        List<({RequestOptions options, ErrorInterceptorHandler handler})>.from(_queue);
    _queue.clear();

    for (final ({RequestOptions options, ErrorInterceptorHandler handler}) item in pending) {
      item.handler.next(original);
    }
  }
}
