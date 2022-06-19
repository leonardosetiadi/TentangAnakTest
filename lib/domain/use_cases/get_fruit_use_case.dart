import 'package:testing/core/resources/data_state.dart';
import 'package:testing/core/use_case/use_case.dart';
import 'package:testing/domain/entities/fruit_response_model.dart';
import 'package:testing/domain/repositories/fruit_repository.dart';

class GetFruitUseCase implements UseCase<DataState<FruitResponseModel>, void> {
  final FruitRepository _fruitRepository;

  GetFruitUseCase(this._fruitRepository);

  @override
  Future<DataState<FruitResponseModel>> get({void params}) async {
    return _fruitRepository.getFruits();
  }
}
