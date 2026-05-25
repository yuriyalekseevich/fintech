import 'package:fintech/core/domain/transaction_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_transaction_dto.freezed.dart';
part 'profile_transaction_dto.g.dart';

@freezed
abstract class ProfileTransactionDto with _$ProfileTransactionDto {
  const ProfileTransactionDto._();

  const factory ProfileTransactionDto({
    required String id,
    required String title,
    required double amount,
    required String date,
  }) = _ProfileTransactionDto;

  factory ProfileTransactionDto.fromJson(Map<String, Object?> json) =>
      _$ProfileTransactionDtoFromJson(json);

  TransactionSummary toDomain() => TransactionSummary(
        id: id,
        title: title,
        amount: amount,
        date: date,
      );
}
