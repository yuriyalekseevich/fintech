import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/features/dashboard/infrastructure/dtos/dashboard_dto.dart';
import 'package:injectable/injectable.dart';

abstract interface class DashboardRemoteDataSource {
  Future<DashboardDto> fetchDashboard();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteDataSourceImpl(@Named('api') this._dio);

  final Dio _dio;

  @override
  Future<DashboardDto> fetchDashboard() async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.dashboard,
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty dashboard response',
        type: DioExceptionType.badResponse,
      );
    }

    return DashboardDto.fromJson(data);
  }
}
