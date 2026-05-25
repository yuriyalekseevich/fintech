import 'package:dio/dio.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/network/dio_failure_mapper.dart';
import 'package:fintech/features/dashboard/domain/entities/dashboard.dart';
import 'package:fintech/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fintech/features/dashboard/infrastructure/datasources/dashboard_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._remoteDataSource);

  final DashboardRemoteDataSource _remoteDataSource;

  @override
  Future<Result<Dashboard>> getDashboard() async {
    try {
      final dto = await _remoteDataSource.fetchDashboard();
      return Success<Dashboard>(dto.toDomain());
    } on DioException catch (error) {
      return Error<Dashboard>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<Dashboard>(
        UnexpectedFailure(
          message: 'Failed to load dashboard',
          cause: error,
        ),
      );
    }
  }
}
