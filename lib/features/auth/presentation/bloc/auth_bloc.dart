import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/deeplink/deep_link_coordinator.dart';
import 'package:fintech/core/domain/auth/auth_session.dart';
import 'package:fintech/core/domain/auth/token_storage.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/auth/domain/entities/auth_tokens.dart';
import 'package:fintech/features/auth/domain/usecases/login_usecase.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_event.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
    this._tokenStorage,
    this._authSession,
    this._deepLinkCoordinator,
  ) : super(const AuthInitial()) {
    on<AuthLoginSubmitted>(
      _onLoginSubmitted,
      transformer: droppable(),
    );
    on<AuthSessionRestored>(_onSessionRestored);
    on<AuthLoggedOutExternally>(
      (_, Emitter<AuthState> emit) => emit(const AuthUnauthenticated()),
    );
    _authSession.addListener(_onExternalSessionChange);
  }

  final LoginUseCase _loginUseCase;
  final TokenStorage _tokenStorage;
  final AuthSession _authSession;
  final DeepLinkCoordinator _deepLinkCoordinator;

  void _onExternalSessionChange() {
    if (!_authSession.isAuthenticated && state is AuthAuthenticated) {
      add(const AuthLoggedOutExternally());
    }
  }

  @override
  Future<void> close() {
    _authSession.removeListener(_onExternalSessionChange);
    return super.close();
  }

  Future<void> _onLoginSubmitted(
    AuthLoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final Result<AuthTokens> result = await _loginUseCase(
      email: event.email,
      password: event.password,
    );

    switch (result) {
      case Success<AuthTokens>():
        _authSession.markLoggedIn();
        emit(const AuthAuthenticated());
        await _deepLinkCoordinator.processPendingAfterAuth();
      case Error<AuthTokens>(:final failure):
        emit(AuthUnauthenticated(failure: failure));
    }
  }

  Future<void> _onSessionRestored(
    AuthSessionRestored event,
    Emitter<AuthState> emit,
  ) async {
    final bool hasSession = await _tokenStorage.hasValidSession();
    if (hasSession) {
      _authSession.markLoggedIn();
      emit(const AuthAuthenticated());
      await _deepLinkCoordinator.processPendingAfterAuth();
    } else {
      emit(const AuthUnauthenticated());
    }
  }
}
