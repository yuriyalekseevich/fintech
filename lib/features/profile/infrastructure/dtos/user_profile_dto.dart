import 'package:fintech/features/profile/domain/entities/user_profile.dart';
import 'package:fintech/features/profile/infrastructure/dtos/profile_transaction_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
abstract class UserProfileDto with _$UserProfileDto {
  const UserProfileDto._();

  const factory UserProfileDto({
    required String id,
    required String fullName,
    required String email,
    required List<ProfileTransactionDto> recentTransactions,
  }) = _UserProfileDto;

  factory UserProfileDto.fromJson(Map<String, Object?> json) =>
      _$UserProfileDtoFromJson(json);

  UserProfile toDomain() => UserProfile(
        id: id,
        fullName: fullName,
        email: email,
        recentTransactions: recentTransactions
            .map((ProfileTransactionDto e) => e.toDomain())
            .toList(),
      );
}
