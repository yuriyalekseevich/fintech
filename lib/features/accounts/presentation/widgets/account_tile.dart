import 'package:fintech/core/presentation/formatters/currency_formatter.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({required this.account, super.key});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.account_balance_wallet_outlined),
        title: Text(account.name),
        subtitle: Text(account.currency),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              CurrencyFormatter.formatAmount(
                amount: account.balance,
                currencyCode: account.currency,
              ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: () => context.push(AppRoutes.accountDetails(account.id)),
      ),
    );
  }
}
