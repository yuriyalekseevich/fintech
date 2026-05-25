import 'package:fintech/core/domain/auth/auth_session.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

/// Signs the user out: clears tokens and updates [AuthSession] for router redirect.
@lazySingleton
class LogoutUseCase {
  LogoutUseCase(this._repository, this._authSession);

  final AuthRepository _repository;
  final AuthSession _authSession;

  Future<Result<void>> call() async {
    final Result<void> result = await _repository.logout();
    if (result is Success<void>) {
      _authSession.markLoggedOut();
    }
    return result;
  }
}
