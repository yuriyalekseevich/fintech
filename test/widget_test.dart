import 'package:fintech/core/deeplink/deep_link_coordinator.dart';
import 'package:fintech/core/deeplink/deep_link_target.dart';
import 'package:fintech/core/router/app_router.dart';
import 'package:fintech/core/router/route_analytics_observer.dart';
import 'package:fintech/core/deeplink/deep_link_navigator.dart';
import 'package:fintech/core/deeplink/deep_link_parser.dart';
import 'package:fintech/core/deeplink/pending_deep_link_store.dart';
import 'package:fintech/core/domain/auth/auth_session.dart';
import 'package:fintech/core/domain/auth/token_storage.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/auth/domain/entities/auth_tokens.dart';
import 'package:fintech/features/auth/domain/repositories/auth_repository.dart';
import 'package:fintech/features/auth/domain/usecases/login_usecase.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_state.dart';
import 'package:fintech/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeAuthRepository implements AuthRepository {
  @override
  Future<Result<AuthTokens>> login({
    required String email,
    required String password,
  }) async {
    return const Error<AuthTokens>(
      AuthFailure(message: 'Not used in widget test'),
    );
  }

  @override
  Future<Result<void>> logout() async => const Success<void>(null);
}

class _FakeTokenStorage implements TokenStorage {
  @override
  Future<void> clearTokens() async {}

  @override
  Future<String?> getAccessToken() async => null;

  @override
  Future<String?> getRefreshToken() async => null;

  @override
  Future<bool> hasValidSession() async => false;

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {}
}

class _FakeDeepLinkNavigator implements DeepLinkNavigator {
  @override
  Future<void> navigate(DeepLinkTarget target) async {}
}

void main() {
  late AuthBloc authBloc;

  setUp(() {
    final AuthSession authSession = AuthSession();
    authBloc = AuthBloc(
      LoginUseCase(_FakeAuthRepository()),
      _FakeTokenStorage(),
      authSession,
      DeepLinkCoordinator(
        authSession,
        PendingDeepLinkStore(),
        DeepLinkParser(),
        _FakeDeepLinkNavigator(),
        AppRouter(
          authSession,
          PendingDeepLinkStore(),
          RouteAnalyticsObserver(),
        ),
      ),
    );
  });

  tearDown(() => authBloc.close());

  testWidgets('Login page renders form fields', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AuthBloc>.value(
          value: authBloc,
          child: const LoginPage(),
        ),
      ),
    );

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(authBloc.state, isA<AuthInitial>());
  });
}
