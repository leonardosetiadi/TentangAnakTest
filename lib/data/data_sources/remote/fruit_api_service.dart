import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:testing/constant/endpoints.dart';
import 'package:testing/domain/entities/fruit_response_model.dart';

part 'fruit_api_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class FruitApiService {
  factory FruitApiService(Dio dio, {String baseUrl}) = _FruitApiService;

  @POST(Endpoints.getFruits)
  Future<HttpResponse<FruitResponseModel>> getFruits();
}
