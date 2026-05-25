import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardTile extends StatelessWidget {
  const CardTile({required this.card, super.key});

  final BankCard card;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.credit_card),
        title: Text('${card.brand} •••• ${card.last4}'),
        subtitle: Text(card.type.toUpperCase()),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push(AppRoutes.cardDetails(card.id)),
      ),
    );
  }
}
