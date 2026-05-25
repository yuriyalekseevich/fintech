import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/profile/domain/entities/user_profile.dart';

abstract interface class ProfileRepository {
  Future<Result<UserProfile>> getProfile();
}
