import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/auth/domain/entities/auth_tokens.dart';

abstract interface class AuthRepository {
  Future<Result<AuthTokens>> login({
    required String email,
    required String password,
  });

  Future<Result<void>> logout();
}
