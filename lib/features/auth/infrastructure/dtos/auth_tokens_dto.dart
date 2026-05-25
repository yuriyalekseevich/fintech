import 'package:fintech/features/auth/domain/entities/auth_tokens.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens_dto.freezed.dart';
part 'auth_tokens_dto.g.dart';

@freezed
abstract class AuthTokensDto with _$AuthTokensDto {
  const AuthTokensDto._();

  const factory AuthTokensDto({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) = _AuthTokensDto;

  factory AuthTokensDto.fromJson(Map<String, Object?> json) =>
      _$AuthTokensDtoFromJson(json);

  AuthTokens toDomain() => AuthTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
      );
}
