sealed class DashboardEvent {
  const DashboardEvent();
}

final class DashboardLoadRequested extends DashboardEvent {
  const DashboardLoadRequested();
}

final class DashboardRefreshRequested extends DashboardEvent {
  const DashboardRefreshRequested();
}
