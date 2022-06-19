import 'package:flutter/foundation.dart';
import 'package:testing/domain/entities/fruit_model.dart';

mixin FruitViewStateStore on ChangeNotifier {
  late Map<String, dynamic> _imagesReferences;

  Map<String, dynamic> get imagesReferences => _imagesReferences;

  set imagesReferences(Map<String, dynamic> value) {
    _imagesReferences = value;
    notifyListeners();
  }

  late List<FruitModel> _filteredFruitModelList;

  List<FruitModel> get filteredFruitModelList => _filteredFruitModelList;

  set filteredFruitModelList(List<FruitModel> value) {
    _filteredFruitModelList = value;
    notifyListeners();
  }

  late List<FruitModel> _fruitModelList;

  List<FruitModel> get fruitModelList => _fruitModelList;

  set fruitModelList(List<FruitModel> value) {
    _fruitModelList = value;
    notifyListeners();
  }

  String _fruitImage = '';

  String get fruitImage => _fruitImage;

  set fruitImage(String value) {
    _fruitImage = value;
    notifyListeners();
  }
}
