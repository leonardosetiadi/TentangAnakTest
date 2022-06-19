import '../../../abstract/data_state.dart';
import '../entities/fruit_response_model.dart';

abstract class FruitRepository {
  Future<DataState<FruitResponseModel>> getFruits();
}
