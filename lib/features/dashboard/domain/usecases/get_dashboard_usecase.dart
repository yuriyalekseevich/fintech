import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/dashboard/domain/entities/dashboard.dart';
import 'package:fintech/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDashboardUseCase {
  GetDashboardUseCase(this._repository);

  final DashboardRepository _repository;

  Future<Result<Dashboard>> call() => _repository.getDashboard();
}
