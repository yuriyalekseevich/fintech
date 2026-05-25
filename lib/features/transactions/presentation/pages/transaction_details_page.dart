import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/features/transactions/presentation/bloc/transaction_details_bloc.dart';
import 'package:fintech/features/transactions/presentation/bloc/transaction_details_event.dart';
import 'package:fintech/features/transactions/presentation/bloc/transaction_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({required this.transactionId, super.key});

  final String transactionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionDetailsBloc>(
      create: (_) => getIt<TransactionDetailsBloc>(
        param1: transactionId,
      )..add(const TransactionDetailsLoadRequested()),
      child: const TransactionDetailsView(),
    );
  }
}

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction details')),
      body: BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
        builder: (BuildContext context, TransactionDetailsState state) {
          return AsyncStateView(
            isLoading: state is TransactionDetailsLoading,
            failure: switch (state) {
              TransactionDetailsError(:final failure) => failure,
              _ => null,
            },
            onRetry: () => context
                .read<TransactionDetailsBloc>()
                .add(const TransactionDetailsLoadRequested()),
            child: switch (state) {
              TransactionDetailsLoaded(:final details) => ListView(
                  padding: const EdgeInsets.all(24),
                  children: <Widget>[
                    Text(
                      details.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${details.currency} ${details.amount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: details.amount < 0
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 24),
                    _DetailRow(label: 'Date', value: details.date),
                    _DetailRow(label: 'Status', value: details.status),
                    _DetailRow(label: 'Category', value: details.category),
                    _DetailRow(label: 'Merchant', value: details.merchant),
                    _DetailRow(label: 'Reference', value: details.reference),
                    const SizedBox(height: 16),
                    Text(
                      details.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              _ => const SizedBox.shrink(),
            },
          );
        },
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
