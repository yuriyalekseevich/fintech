import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/presentation/formatters/currency_formatter.dart';
import 'package:fintech/core/presentation/widgets/confirm_delete_dialog.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/usecases/delete_account_usecase.dart';
import 'package:fintech/features/accounts/presentation/bloc/accounts_bloc.dart';
import 'package:fintech/features/accounts/presentation/bloc/accounts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({required this.account, super.key});

  final Account account;

  Future<void> _deleteAccount(BuildContext context) async {
    final bool confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Remove account?',
      message: 'This will permanently remove "${account.name}".',
    );
    if (!confirmed || !context.mounted) {
      return;
    }

    final Result<void> result =
        await getIt<DeleteAccountUseCase>()(accountId: account.id);

    if (!context.mounted) {
      return;
    }

    switch (result) {
      case Success<void>():
        context.read<AccountsBloc>().add(const AccountsRefreshRequested());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account removed')),
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
            PopupMenuButton<String>(
              onSelected: (String value) async {
                switch (value) {
                  case 'delete':
                    await _deleteAccount(context);
                  case 'open':
                    final bool? changed = await context.push<bool>(
                      AppRoutes.accountDetails(account.id),
                    );
                    if (changed == true && context.mounted) {
                      context
                          .read<AccountsBloc>()
                          .add(const AccountsRefreshRequested());
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
                    title: Text('Remove account'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () async {
          final bool? changed =
              await context.push<bool>(AppRoutes.accountDetails(account.id));
          if (changed == true && context.mounted) {
            context.read<AccountsBloc>().add(const AccountsRefreshRequested());
          }
        },
      ),
    );
  }
}
