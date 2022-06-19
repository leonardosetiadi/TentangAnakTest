import 'package:flutter/foundation.dart';
import 'package:testing/core/resources/data_state.dart';
import 'package:testing/domain/use_cases/get_fruit_use_case.dart';
import 'package:testing/feature/store/fruit_view_state_store.dart';
import 'package:testing/mixins/common_store_mixin.dart';

class FruitStore extends ChangeNotifier
    with FruitViewStateStore, SingleLoadingStoreMixin, SingleErrorMessageMixin {
  final GetFruitUseCase _getFruitUseCase;

  FruitStore(this._getFruitUseCase) {
    _getFruits();
  }

  void _getFruits() async {
    $showLoading();

    final dataState = await _getFruitUseCase.get();

    if (dataState is DataSuccess) {
      imagesReferences = dataState.data!.imagesReferences!;
      fruitModelList = dataState.data!.fruits!;
      filteredFruitModelList = dataState.data!.fruits!.toSet().toList();
    }

    if (dataState is DataFailed) {
      $setErrorMessage(dataState.error!.message);
    }

    $hideLoading();
  }

  String getFruitName(int position) {
    return filteredFruitModelList[position].name!;
  }

  int getFruitPrice(int position) {
    return filteredFruitModelList[position].price!;
  }

  void changeFruitImage(String fruitName) {
    fruitImage = imagesReferences[fruitName] ?? '';
  }

  String getFruitWithHighestQuantity() {
    List<String> fruitNameList = [];
    Map<String, int> filteredFruitMap = {};

    for (var fruitModel in fruitModelList) {
      if (fruitNameList.contains(fruitModel.name)) {
        filteredFruitMap[fruitModel.name!] = filteredFruitMap.update(
          fruitModel.name!,
          (fruitCount) => fruitCount + 1,
        );
      } else {
        fruitNameList.add(fruitModel.name!);
        filteredFruitMap[fruitModel.name!] = 1;
      }
    }

    var highestTotalFruit = 0;
    var nameOfHighestTotalFruit = '';

    filteredFruitMap.forEach((fruitName, totalFruit) {
      if (totalFruit > highestTotalFruit) {
        highestTotalFruit = totalFruit;
        nameOfHighestTotalFruit = fruitName;
      }
    });

    return '$nameOfHighestTotalFruit total is $highestTotalFruit';
  }
}
