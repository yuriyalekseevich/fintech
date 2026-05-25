import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/profile/domain/entities/user_profile.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/core/presentation/widgets/transaction_summary_tile.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:fintech/features/profile/presentation/bloc/profile_event.dart';
import 'package:fintech/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => getIt<ProfileBloc>()..add(const ProfileLoadRequested()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (BuildContext context, ProfileState state) {
              final bool isLoggingOut = state is ProfileLoggingOut;
              return PopupMenuButton<String>(
                enabled: !isLoggingOut,
                onSelected: (String value) {
                  if (value == 'logout') {
                    context
                        .read<ProfileBloc>()
                        .add(const ProfileLogoutRequested());
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'logout',
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.logout,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isLoggingOut ? 'Signing out...' : 'Logout',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
          final bool isLoading = state is ProfileLoading;
          final Failure? failure = switch (state) {
            ProfileError(:final failure) => failure,
            _ => null,
          };

          return AsyncStateView(
            isLoading: isLoading,
            failure: failure,
            onRetry: () =>
                context.read<ProfileBloc>().add(const ProfileLoadRequested()),
            child: switch (state) {
              ProfileLoaded(:final profile) ||
              ProfileLoggingOut(:final profile) =>
                _ProfileContent(profile: profile),
              ProfileError(:final profile) when profile != null =>
                _ProfileContent(profile: profile),
              _ => const SizedBox.shrink(),
            },
          );
        },
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          child: Text(
            profile.fullName.isNotEmpty ? profile.fullName[0].toUpperCase() : '?',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          profile.fullName,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          profile.email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Recent transactions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () => context.push(AppRoutes.transactions),
              child: const Text('See all'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (profile.recentTransactions.isEmpty)
          Text(
            'No transactions yet',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          )
        else
          ...profile.recentTransactions.map(
            (transaction) => TransactionSummaryTile(
              transaction: transaction,
              onTap: () => context.push(
                AppRoutes.transactionDetails(transaction.id),
              ),
            ),
          ),
        const SizedBox(height: 32),
        FilledButton.icon(
          onPressed: () => context.push(AppRoutes.transactions),
          icon: const Icon(Icons.receipt_long_outlined),
          label: const Text('Transactions'),
        ),
      ],
    );
  }
}
