import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/presentation/widgets/async_state_view.dart';
import 'package:fintech/core/router/app_routes.dart';
import 'package:fintech/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:fintech/features/cards/presentation/bloc/cards_event.dart';
import 'package:fintech/features/cards/presentation/bloc/cards_state.dart';
import 'package:fintech/features/cards/presentation/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardsBloc>(
      create: (_) => getIt<CardsBloc>()..add(const CardsLoadRequested()),
      child: const CardsView(),
    );
  }
}

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final bool? changed =
              await context.push<bool>(AppRoutes.addCard);
          if (changed == true && context.mounted) {
            context.read<CardsBloc>().add(const CardsRefreshRequested());
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Add card'),
      ),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (BuildContext context, CardsState state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<CardsBloc>().add(const CardsRefreshRequested());
              await context.read<CardsBloc>().stream.firstWhere(
                    (CardsState s) => s is! CardsLoading,
                  );
            },
            child: AsyncStateView(
              isLoading: state is CardsLoading,
              failure: switch (state) {
                CardsError(:final failure) => failure,
                _ => null,
              },
              onRetry: () =>
                  context.read<CardsBloc>().add(const CardsLoadRequested()),
              child: switch (state) {
                CardsLoaded(:final cards) => ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: cards.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, int index) => CardTile(card: cards[index]),
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
