import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/profile/domain/entities/user_profile.dart';
import 'package:fintech/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProfileUseCase {
  GetProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<Result<UserProfile>> call() => _repository.getProfile();
}
