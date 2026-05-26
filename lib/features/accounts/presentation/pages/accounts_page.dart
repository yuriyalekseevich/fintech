import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/accounts/presentation/bloc/accounts_bloc.dart';
import 'package:fintech/features/accounts/presentation/bloc/accounts_event.dart';
import 'package:fintech/features/accounts/presentation/bloc/accounts_state.dart';
import 'package:fintech/features/accounts/presentation/widgets/account_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountsBloc>(
      create: (_) => getIt<AccountsBloc>()..add(const AccountsLoadRequested()),
      child: const AccountsView(),
    );
  }
}

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accounts')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final bool? changed =
              await context.push<bool>(AppRoutes.addAccount);
          if (changed == true && context.mounted) {
            context
                .read<AccountsBloc>()
                .add(const AccountsRefreshRequested());
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Add account'),
      ),
      body: BlocBuilder<AccountsBloc, AccountsState>(
        builder: (BuildContext context, AccountsState state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<AccountsBloc>().add(const AccountsRefreshRequested());
              await context.read<AccountsBloc>().stream.firstWhere(
                    (AccountsState s) => s is! AccountsLoading,
                  );
            },
            child: AsyncStateView(
              isLoading: state is AccountsLoading,
              failure: switch (state) {
                AccountsError(:final failure) => failure,
                _ => null,
              },
              onRetry: () =>
                  context.read<AccountsBloc>().add(const AccountsLoadRequested()),
              child: switch (state) {
                AccountsLoaded(:final accounts) => ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: accounts.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, int index) =>
                        AccountTile(account: accounts[index]),
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
