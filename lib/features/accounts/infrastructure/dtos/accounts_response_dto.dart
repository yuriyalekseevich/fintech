import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_response_dto.freezed.dart';
part 'accounts_response_dto.g.dart';

@freezed
abstract class AccountDto with _$AccountDto {
  const AccountDto._();

  const factory AccountDto({
    required String id,
    required String name,
    required double balance,
    required String currency,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, Object?> json) =>
      _$AccountDtoFromJson(json);

  Account toDomain() => Account(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
      );
}

@freezed
abstract class AccountsResponseDto with _$AccountsResponseDto {
  const AccountsResponseDto._();

  const factory AccountsResponseDto({
    required List<AccountDto> accounts,
  }) = _AccountsResponseDto;

  factory AccountsResponseDto.fromJson(Map<String, Object?> json) =>
      _$AccountsResponseDtoFromJson(json);
}
