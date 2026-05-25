import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:fintech/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:fintech/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:fintech/features/dashboard/presentation/widgets/balance_card.dart';
import 'package:fintech/features/dashboard/presentation/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (_) =>
          getIt<DashboardBloc>()..add(const DashboardLoadRequested()),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (BuildContext context, DashboardState state) {
          final bool isLoading = state is DashboardLoading;
          final Failure? failure = switch (state) {
            DashboardError(:final failure) => failure,
            _ => null,
          };

          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<DashboardBloc>()
                  .add(const DashboardRefreshRequested());
              await context.read<DashboardBloc>().stream.firstWhere(
                    (DashboardState s) => s is! DashboardLoading,
                  );
            },
            child: AsyncStateView(
              isLoading: isLoading && state is! DashboardLoaded,
              failure: failure,
              onRetry: () => context
                  .read<DashboardBloc>()
                  .add(const DashboardLoadRequested()),
              child: switch (state) {
                DashboardLoaded(:final dashboard) => ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    children: <Widget>[
                      BalanceCard(
                        balance: dashboard.balance,
                        currency: dashboard.currency,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Recent transactions',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      ...dashboard.recentTransactions.map(
                        (transaction) => TransactionTile(
                          transaction: transaction,
                        ),
                      ),
                    ],
                  ),
                _ => ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const <Widget>[SizedBox(height: 200)],
                  ),
              },
            ),
          );
        },
      ),
    );
  }
}
