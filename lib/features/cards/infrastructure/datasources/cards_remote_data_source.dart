import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/features/cards/infrastructure/dtos/card_details_dto.dart';
import 'package:fintech/features/cards/infrastructure/dtos/cards_response_dto.dart';
import 'package:fintech/features/cards/infrastructure/dtos/create_card_request_dto.dart';
import 'package:injectable/injectable.dart';

abstract interface class CardsRemoteDataSource {
  Future<CardsResponseDto> fetchCards();

  Future<CardDetailsDto> fetchCardDetails({required String cardId});

  Future<BankCardDto> createCard(CreateCardRequestDto request);

  Future<void> deleteCard({required String cardId});
}

@LazySingleton(as: CardsRemoteDataSource)
class CardsRemoteDataSourceImpl implements CardsRemoteDataSource {
  CardsRemoteDataSourceImpl(@Named('api') this._dio);

  final Dio _dio;

  @override
  Future<CardsResponseDto> fetchCards() async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.cards,
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty cards response',
        type: DioExceptionType.badResponse,
      );
    }

    return CardsResponseDto.fromJson(data);
  }

  @override
  Future<CardDetailsDto> fetchCardDetails({required String cardId}) async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.cardDetails(cardId),
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty card details response',
        type: DioExceptionType.badResponse,
      );
    }

    return CardDetailsDto.fromJson(data);
  }

  @override
  Future<BankCardDto> createCard(CreateCardRequestDto request) async {
    final Response<Map<String, Object?>> response =
        await _dio.post<Map<String, Object?>>(
      ApiEndpoints.cards,
      data: request.toJson(),
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty create card response',
        type: DioExceptionType.badResponse,
      );
    }

    return BankCardDto.fromJson(data);
  }

  @override
  Future<void> deleteCard({required String cardId}) async {
    await _dio.delete<void>(ApiEndpoints.cardDetails(cardId));
  }
}
