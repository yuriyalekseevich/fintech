import 'package:fintech/features/dashboard/domain/entities/dashboard.dart';
import 'package:fintech/features/dashboard/domain/entities/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_dto.freezed.dart';
part 'dashboard_dto.g.dart';

@freezed
abstract class TransactionDto with _$TransactionDto {
  const TransactionDto._();

  const factory TransactionDto({
    required String id,
    required String title,
    required double amount,
    required String date,
  }) = _TransactionDto;

  factory TransactionDto.fromJson(Map<String, Object?> json) =>
      _$TransactionDtoFromJson(json);

  Transaction toDomain() => Transaction(
        id: id,
        title: title,
        amount: amount,
        date: date,
      );
}

@freezed
abstract class DashboardDto with _$DashboardDto {
  const DashboardDto._();

  const factory DashboardDto({
    required double balance,
    required String currency,
    required List<TransactionDto> recentTransactions,
  }) = _DashboardDto;

  factory DashboardDto.fromJson(Map<String, Object?> json) =>
      _$DashboardDtoFromJson(json);

  Dashboard toDomain() => Dashboard(
        balance: balance,
        currency: currency,
        recentTransactions:
            recentTransactions.map((TransactionDto e) => e.toDomain()).toList(),
      );
}
