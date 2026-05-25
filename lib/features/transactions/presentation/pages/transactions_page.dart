import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/core/presentation/widgets/transaction_summary_tile.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:fintech/features/transactions/presentation/bloc/transactions_event.dart';
import 'package:fintech/features/transactions/presentation/bloc/transactions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (_) =>
          getIt<TransactionsBloc>()..add(const TransactionsLoadRequested()),
      child: const TransactionsView(),
    );
  }
}

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: BlocBuilder<TransactionsBloc, TransactionsState>(
        builder: (BuildContext context, TransactionsState state) {
          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<TransactionsBloc>()
                  .add(const TransactionsRefreshRequested());
              await context.read<TransactionsBloc>().stream.firstWhere(
                    (TransactionsState s) => s is! TransactionsLoading,
                  );
            },
            child: AsyncStateView(
              isLoading: state is TransactionsLoading,
              failure: switch (state) {
                TransactionsError(:final failure) => failure,
                _ => null,
              },
              onRetry: () => context
                  .read<TransactionsBloc>()
                  .add(const TransactionsLoadRequested()),
              child: switch (state) {
                TransactionsLoaded(:final transactions) => ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: transactions.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, int index) {
                      final transaction = transactions[index];
                      return TransactionSummaryTile(
                        transaction: transaction,
                        onTap: () => context.push(
                          AppRoutes.transactionDetails(transaction.id),
                        ),
                      );
                    },
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
