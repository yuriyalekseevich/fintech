import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/auth/domain/usecases/logout_usecase.dart';
import 'package:fintech/features/profile/domain/entities/user_profile.dart';
import 'package:fintech/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:fintech/features/profile/presentation/bloc/profile_event.dart';
import 'package:fintech/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._getProfileUseCase,
    this._logoutUseCase,
  ) : super(const ProfileInitial()) {
    on<ProfileLoadRequested>(_onLoad, transformer: droppable());
    on<ProfileLogoutRequested>(
      _onLogout,
      transformer: droppable(),
    );
  }

  final GetProfileUseCase _getProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> _onLoad(
    ProfileLoadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    final Result<UserProfile> result = await _getProfileUseCase();

    switch (result) {
      case Success<UserProfile>(:final value):
        emit(ProfileLoaded(value));
      case Error<UserProfile>(:final failure):
        emit(ProfileError(failure));
    }
  }

  Future<void> _onLogout(
    ProfileLogoutRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final UserProfile? profile = switch (state) {
      ProfileLoaded(:final profile) => profile,
      ProfileLoggingOut(:final profile) => profile,
      ProfileError(:final profile) => profile,
      _ => null,
    };

    if (profile != null) {
      emit(ProfileLoggingOut(profile));
    }

    final Result<void> result = await _logoutUseCase();

    switch (result) {
      case Success<void>():
        emit(const ProfileInitial());
      case Error<void>(:final failure):
        if (profile != null) {
          emit(ProfileError(failure, profile: profile));
        } else {
          emit(ProfileError(failure));
        }
    }
  }
}
