import 'dart:io';

import 'package:dio/dio.dart';

import '../../../abstract/data_state.dart';
import '../../../domain/fruit/entities/fruit_response_model.dart';
import '../../../domain/fruit/repositories/fruit_repository.dart';
import '../data_sources/remote/fruit_api_service.dart';

class FruitRepositoryImpl implements FruitRepository {
  final FruitApiService _fruitApiService;

  const FruitRepositoryImpl(this._fruitApiService);

  @override
  Future<DataState<FruitResponseModel>> getFruits() async {
    try {
      final httpResponse = await _fruitApiService.getFruits();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
            type: DioErrorType.response,
          ),
        );
      }
    } on DioError catch (error) {
      return DataFailed(error);
    }
  }
}
