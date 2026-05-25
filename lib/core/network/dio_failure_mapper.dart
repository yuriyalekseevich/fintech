import 'package:dio/dio.dart';
import 'package:fintech/core/domain/failure.dart';

abstract final class DioFailureMapper {
  static Failure map(DioException error) {
    final int? statusCode = error.response?.statusCode;
    final Object? data = error.response?.data;

    if (statusCode == 401) {
      final String message = _extractMessage(data) ?? 'Unauthorized';
      return AuthFailure(message: message);
    }

    if (statusCode != null && statusCode >= 500) {
      return NetworkFailure(
        message: _extractMessage(data) ?? 'Server error',
        statusCode: statusCode,
      );
    }

    return NetworkFailure(
      message: _extractMessage(data) ?? error.message ?? 'Network request failed',
      statusCode: statusCode,
    );
  }

  static String? _extractMessage(Object? data) {
    if (data is Map<String, Object?>) {
      final Object? error = data['error'] ?? data['message'];
      if (error is String) {
        return error;
      }
    }
    return null;
  }
}
