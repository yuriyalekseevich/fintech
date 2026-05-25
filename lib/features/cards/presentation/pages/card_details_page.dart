import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/presentation/formatters/currency_formatter.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/features/cards/presentation/bloc/card_details_bloc.dart';
import 'package:fintech/features/cards/presentation/bloc/card_details_event.dart';
import 'package:fintech/features/cards/presentation/bloc/card_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDetailsPage extends StatelessWidget {
  const CardDetailsPage({required this.cardId, super.key});

  final String cardId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardDetailsBloc>(
      create: (_) => getIt<CardDetailsBloc>(param1: cardId)
        ..add(const CardDetailsLoadRequested()),
      child: const CardDetailsView(),
    );
  }
}

class CardDetailsView extends StatelessWidget {
  const CardDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card details')),
      body: BlocBuilder<CardDetailsBloc, CardDetailsState>(
        builder: (BuildContext context, CardDetailsState state) {
          return AsyncStateView(
            isLoading: state is CardDetailsLoading,
            failure: switch (state) {
              CardDetailsError(:final failure) => failure,
              _ => null,
            },
            onRetry: () => context
                .read<CardDetailsBloc>()
                .add(const CardDetailsLoadRequested()),
            child: switch (state) {
              CardDetailsLoaded(:final details) => ListView(
                  padding: const EdgeInsets.all(24),
                  children: <Widget>[
                    Text(
                      '${details.brand} •••• ${details.last4}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      details.type.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 24),
                    _DetailRow(label: 'Holder', value: details.holderName),
                    _DetailRow(label: 'Expires', value: details.expiryDate),
                    _DetailRow(label: 'Status', value: details.status),
                    _DetailRow(
                      label: 'Daily limit',
                      value: CurrencyFormatter.formatAmount(
                        amount: details.dailyLimit,
                        currencyCode: details.currency,
                      ),
                    ),
                    _DetailRow(label: 'Currency', value: details.currency),
                    _DetailRow(label: 'Card ID', value: details.id),
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
