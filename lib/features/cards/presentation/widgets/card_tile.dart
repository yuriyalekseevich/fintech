import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/presentation/widgets/confirm_delete_dialog.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/usecases/delete_card_usecase.dart';
import 'package:fintech/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:fintech/features/cards/presentation/bloc/cards_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CardTile extends StatelessWidget {
  const CardTile({required this.card, super.key});

  final BankCard card;

  Future<void> _deleteCard(BuildContext context) async {
    final bool confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Remove card?',
      message:
          'This will permanently remove ${card.brand} •••• ${card.last4}.',
    );
    if (!confirmed || !context.mounted) {
      return;
    }

    final Result<void> result =
        await getIt<DeleteCardUseCase>()(cardId: card.id);

    if (!context.mounted) {
      return;
    }

    switch (result) {
      case Success<void>():
        context.read<CardsBloc>().add(const CardsRefreshRequested());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Card removed')),
        );
      case Error<void>(:final failure):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.credit_card),
        title: Text('${card.brand} •••• ${card.last4}'),
        subtitle: Text(card.type.toUpperCase()),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) async {
            switch (value) {
              case 'delete':
                await _deleteCard(context);
              case 'open':
                final bool? changed = await context.push<bool>(
                  AppRoutes.cardDetails(card.id),
                );
                if (changed == true && context.mounted) {
                  context.read<CardsBloc>().add(const CardsRefreshRequested());
                }
            }
          },
          itemBuilder: (_) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'open',
              child: ListTile(
                leading: Icon(Icons.open_in_new),
                title: Text('View details'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem<String>(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete_outline, color: Colors.red),
                title: Text('Remove card'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
        onTap: () async {
          final bool? changed =
              await context.push<bool>(AppRoutes.cardDetails(card.id));
          if (changed == true && context.mounted) {
            context.read<CardsBloc>().add(const CardsRefreshRequested());
          }
        },
      ),
    );
  }
}
