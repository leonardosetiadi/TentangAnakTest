import '../../../abstracts/data_state.dart';
import '../entities/fruit_response_model.dart';
import '../repositories/fruit_repository.dart';

class GetFruitUseCase {
  final FruitRepository _fruitRepository;

  GetFruitUseCase(this._fruitRepository);

  @override
  Future<DataState<FruitResponseModel>> get({void params}) async {
    return _fruitRepository.getFruits();
  }
}
