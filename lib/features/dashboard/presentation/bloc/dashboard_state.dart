import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/dashboard/domain/entities/dashboard.dart';

sealed class DashboardState {
  const DashboardState();
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

final class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

final class DashboardLoaded extends DashboardState {
  const DashboardLoaded(this.dashboard);

  final Dashboard dashboard;
}

final class DashboardError extends DashboardState {
  const DashboardError(this.failure);

  final Failure failure;
}
