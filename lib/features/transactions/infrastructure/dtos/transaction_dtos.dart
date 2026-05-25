import 'package:fintech/core/domain/transaction_summary.dart';
import 'package:fintech/features/transactions/domain/entities/transaction_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_dtos.freezed.dart';
part 'transaction_dtos.g.dart';

@freezed
abstract class TransactionSummaryDto with _$TransactionSummaryDto {
  const TransactionSummaryDto._();

  const factory TransactionSummaryDto({
    required String id,
    required String title,
    required double amount,
    required String date,
  }) = _TransactionSummaryDto;

  factory TransactionSummaryDto.fromJson(Map<String, Object?> json) =>
      _$TransactionSummaryDtoFromJson(json);

  TransactionSummary toDomain() => TransactionSummary(
        id: id,
        title: title,
        amount: amount,
        date: date,
      );
}

@freezed
abstract class TransactionsListDto with _$TransactionsListDto {
  const factory TransactionsListDto({
    required List<TransactionSummaryDto> transactions,
  }) = _TransactionsListDto;

  factory TransactionsListDto.fromJson(Map<String, Object?> json) =>
      _$TransactionsListDtoFromJson(json);
}

@freezed
abstract class TransactionDetailsDto with _$TransactionDetailsDto {
  const TransactionDetailsDto._();

  const factory TransactionDetailsDto({
    required String id,
    required String title,
    required double amount,
    required String currency,
    required String date,
    required String category,
    required String status,
    required String merchant,
    required String reference,
    required String description,
  }) = _TransactionDetailsDto;

  factory TransactionDetailsDto.fromJson(Map<String, Object?> json) =>
      _$TransactionDetailsDtoFromJson(json);

  TransactionDetails toDomain() => TransactionDetails(
        id: id,
        title: title,
        amount: amount,
        currency: currency,
        date: date,
        category: category,
        status: status,
        merchant: merchant,
        reference: reference,
        description: description,
      );
}
