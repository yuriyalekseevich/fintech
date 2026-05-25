import 'package:fintech/features/dashboard/domain/entities/transaction.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({required this.transaction, super.key});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final bool isDebit = transaction.amount < 0;
    final Color amountColor = isDebit
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.primary;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Icon(
          isDebit ? Icons.arrow_downward : Icons.arrow_upward,
          size: 18,
        ),
      ),
      title: Text(transaction.title),
      subtitle: Text(transaction.date),
      trailing: Text(
        '${isDebit ? '' : '+'}${transaction.amount.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: amountColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
