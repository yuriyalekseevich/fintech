import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/router/app_router.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FintechApp extends StatelessWidget {
  // Do not add {super.key} — injectable registers Key as a GetIt dependency.
  const FintechApp(this._appRouter, {super.key});

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>.value(
      value: getIt<AuthBloc>(),
      child: MaterialApp.router(
        title: 'Fintech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B4D3E)),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.router,
      ),
    );
  }
}
