import 'package:fintech/features/accounts/domain/entities/account_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details_dto.freezed.dart';
part 'account_details_dto.g.dart';

@freezed
abstract class AccountDetailsDto with _$AccountDetailsDto {
  const AccountDetailsDto._();

  const factory AccountDetailsDto({
    required String id,
    required String name,
    required double balance,
    required String currency,
    required String iban,
    required String accountType,
    required String status,
  }) = _AccountDetailsDto;

  factory AccountDetailsDto.fromJson(Map<String, Object?> json) =>
      _$AccountDetailsDtoFromJson(json);

  AccountDetails toDomain() => AccountDetails(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
        iban: iban,
        accountType: accountType,
        status: status,
      );
}
