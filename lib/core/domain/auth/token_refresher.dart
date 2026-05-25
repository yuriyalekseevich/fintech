import 'package:fintech/core/domain/result.dart';

/// Refreshes an expired access token. Auth feature provides the implementation;
/// [AuthInterceptor] depends only on this contract.
abstract interface class TokenRefresher {
  Future<Result<void>> refresh();
}
