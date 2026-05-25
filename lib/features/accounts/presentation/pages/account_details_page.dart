import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/presentation/formatters/currency_formatter.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/features/accounts/presentation/bloc/account_details_bloc.dart';
import 'package:fintech/features/accounts/presentation/bloc/account_details_event.dart';
import 'package:fintech/features/accounts/presentation/bloc/account_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({required this.accountId, super.key});

  final String accountId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountDetailsBloc>(
      create: (_) => getIt<AccountDetailsBloc>(param1: accountId)
        ..add(const AccountDetailsLoadRequested()),
      child: const AccountDetailsView(),
    );
  }
}

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account details')),
      body: BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
        builder: (BuildContext context, AccountDetailsState state) {
          return AsyncStateView(
            isLoading: state is AccountDetailsLoading,
            failure: switch (state) {
              AccountDetailsError(:final failure) => failure,
              _ => null,
            },
            onRetry: () => context
                .read<AccountDetailsBloc>()
                .add(const AccountDetailsLoadRequested()),
            child: switch (state) {
              AccountDetailsLoaded(:final details) => ListView(
                  padding: const EdgeInsets.all(24),
                  children: <Widget>[
                    Text(
                      details.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      CurrencyFormatter.formatAmount(
                        amount: details.balance,
                        currencyCode: details.currency,
                      ),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 24),
                    _DetailRow(label: 'Type', value: details.accountType),
                    _DetailRow(label: 'Status', value: details.status),
                    _DetailRow(label: 'Currency', value: details.currency),
                    _DetailRow(label: 'IBAN', value: details.iban),
                    _DetailRow(label: 'Account ID', value: details.id),
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
