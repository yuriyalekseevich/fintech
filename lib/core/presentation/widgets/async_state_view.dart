import 'package:fintech/core/domain/failure.dart';
import 'package:flutter/material.dart';

/// Shared loading / error / content layout for feature pages.
class AsyncStateView extends StatelessWidget {
  const AsyncStateView({
    required this.isLoading,
    required this.failure,
    required this.onRetry,
    required this.child,
    super.key,
  });

  final bool isLoading;
  final Failure? failure;
  final VoidCallback onRetry;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (failure != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                failure!.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return child;
  }
}
