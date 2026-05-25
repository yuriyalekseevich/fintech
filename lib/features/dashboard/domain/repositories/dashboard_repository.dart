import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/dashboard/domain/entities/dashboard.dart';

abstract interface class DashboardRepository {
  Future<Result<Dashboard>> getDashboard();
}
