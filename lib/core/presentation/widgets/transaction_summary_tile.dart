import 'package:fintech/core/domain/transaction_summary.dart';
import 'package:flutter/material.dart';

class TransactionSummaryTile extends StatelessWidget {
  const TransactionSummaryTile({
    required this.transaction,
    this.onTap,
    super.key,
  });

  final TransactionSummary transaction;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDebit = transaction.amount < 0;
    final Color amountColor = isDebit
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.primary;

    return ListTile(
      onTap: onTap,
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
