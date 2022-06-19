import 'package:testing/core/resources/data_state.dart';
import 'package:testing/domain/entities/fruit_response_model.dart';

abstract class FruitRepository {
  Future<DataState<FruitResponseModel>> getFruits();
}
