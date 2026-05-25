import 'package:fintech/core/deeplink/deep_link_coordinator.dart';
import 'package:fintech/core/deeplink/deep_link_listener.dart';
import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/domain/auth/auth_session.dart';
import 'package:fintech/core/domain/auth/token_storage.dart';
import 'package:fintech/core/infrastructure/notifications/notification_service.dart';
import 'package:fintech/core/presentation/app.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  // Push channel handler must be registered before native forwards tap events.
  await getIt<NotificationService>().initialize();

  await _restoreSession();

  await getIt<DeepLinkListener>().initialize();

  getIt<AuthBloc>().add(const AuthSessionRestored());

  if (getIt<AuthSession>().isAuthenticated) {
    await getIt<DeepLinkCoordinator>().processPendingAfterAuth();
  }

  runApp(getIt<FintechApp>());
}

/// Restores router auth state from secure storage on cold start.
Future<void> _restoreSession() async {
  final TokenStorage tokenStorage = getIt<TokenStorage>();
  final AuthSession authSession = getIt<AuthSession>();
  final bool hasSession = await tokenStorage.hasValidSession();
  authSession.setAuthenticated(value: hasSession);
}
