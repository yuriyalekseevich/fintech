import 'package:dio/dio.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/network/dio_failure_mapper.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/entities/card_details.dart';
import 'package:fintech/features/cards/domain/repositories/cards_repository.dart';
import 'package:fintech/features/cards/infrastructure/datasources/cards_remote_data_source.dart';
import 'package:fintech/features/cards/infrastructure/dtos/card_details_dto.dart';
import 'package:fintech/features/cards/infrastructure/dtos/cards_response_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardsRepository)
class CardsRepositoryImpl implements CardsRepository {
  CardsRepositoryImpl(this._remoteDataSource);

  final CardsRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<BankCard>>> getCards() async {
    try {
      final CardsResponseDto dto = await _remoteDataSource.fetchCards();
      final List<BankCard> cards =
          dto.cards.map((BankCardDto e) => e.toDomain()).toList();
      return Success<List<BankCard>>(cards);
    } on DioException catch (error) {
      return Error<List<BankCard>>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<List<BankCard>>(
        UnexpectedFailure(message: 'Failed to load cards', cause: error),
      );
    }
  }

  @override
  Future<Result<CardDetails>> getCardDetails({required String cardId}) async {
    try {
      final CardDetailsDto dto =
          await _remoteDataSource.fetchCardDetails(cardId: cardId);
      return Success<CardDetails>(dto.toDomain());
    } on DioException catch (error) {
      return Error<CardDetails>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<CardDetails>(
        UnexpectedFailure(
          message: 'Failed to load card details',
          cause: error,
        ),
      );
    }
  }
}
