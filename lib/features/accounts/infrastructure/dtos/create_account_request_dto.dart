import 'package:fintech/features/accounts/domain/requests/create_account_request.dart';

final class CreateAccountRequestDto {
  const CreateAccountRequestDto({
    required this.name,
    required this.currency,
    required this.accountType,
    required this.initialBalance,
  });

  factory CreateAccountRequestDto.fromDomain(CreateAccountRequest request) {
    return CreateAccountRequestDto(
      name: request.name,
      currency: request.currency.code,
      accountType: request.accountType,
      initialBalance: request.initialBalance,
    );
  }

  final String name;
  final String currency;
  final String accountType;
  final double initialBalance;

  Map<String, Object?> toJson() => <String, Object?>{
        'name': name,
        'currency': currency,
        'accountType': accountType,
        'initialBalance': initialBalance,
      };
}
