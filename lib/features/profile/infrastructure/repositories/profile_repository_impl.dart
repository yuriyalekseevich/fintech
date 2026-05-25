import 'package:dio/dio.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/network/dio_failure_mapper.dart';
import 'package:fintech/features/profile/domain/entities/user_profile.dart';
import 'package:fintech/features/profile/domain/repositories/profile_repository.dart';
import 'package:fintech/features/profile/infrastructure/datasources/profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remoteDataSource);

  final ProfileRemoteDataSource _remoteDataSource;

  @override
  Future<Result<UserProfile>> getProfile() async {
    try {
      final dto = await _remoteDataSource.fetchProfile();
      return Success<UserProfile>(dto.toDomain());
    } on DioException catch (error) {
      return Error<UserProfile>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<UserProfile>(
        UnexpectedFailure(message: 'Failed to load profile', cause: error),
      );
    }
  }
}
