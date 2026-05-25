import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/profile/domain/entities/user_profile.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded(this.profile);

  final UserProfile profile;
}

final class ProfileLoggingOut extends ProfileState {
  const ProfileLoggingOut(this.profile);

  final UserProfile profile;
}

final class ProfileError extends ProfileState {
  const ProfileError(this.failure, {this.profile});

  final Failure failure;
  final UserProfile? profile;
}
