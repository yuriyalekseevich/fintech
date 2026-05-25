import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/auth/domain/entities/auth_tokens.dart';
import 'package:fintech/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<Result<AuthTokens>> call({
    required String email,
    required String password,
  }) async {
    final String trimmedEmail = email.trim();
    final String trimmedPassword = password.trim();

    if (trimmedEmail.isEmpty || trimmedPassword.isEmpty) {
      return const Error<AuthTokens>(
        AuthFailure(message: 'Email and password are required'),
      );
    }

    return _repository.login(
      email: trimmedEmail,
      password: trimmedPassword,
    );
  }
}
