import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/features/cards/infrastructure/dtos/card_details_dto.dart';
import 'package:fintech/features/cards/infrastructure/dtos/cards_response_dto.dart';
import 'package:injectable/injectable.dart';

abstract interface class CardsRemoteDataSource {
  Future<CardsResponseDto> fetchCards();

  Future<CardDetailsDto> fetchCardDetails({required String cardId});
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
}
