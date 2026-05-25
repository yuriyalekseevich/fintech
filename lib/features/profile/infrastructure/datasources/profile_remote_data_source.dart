import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/features/profile/infrastructure/dtos/user_profile_dto.dart';
import 'package:injectable/injectable.dart';

abstract interface class ProfileRemoteDataSource {
  Future<UserProfileDto> fetchProfile();
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(@Named('api') this._dio);

  final Dio _dio;

  @override
  Future<UserProfileDto> fetchProfile() async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.profile,
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty profile response',
        type: DioExceptionType.badResponse,
      );
    }

    return UserProfileDto.fromJson(data);
  }
}
