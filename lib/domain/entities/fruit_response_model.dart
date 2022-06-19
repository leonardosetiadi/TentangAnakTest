import 'package:testing/domain/entities/fruit_model.dart';

class FruitResponseModel {
  Map<String, dynamic>? imagesReferences;
  List<FruitModel>? fruits;

  FruitResponseModel({
    this.imagesReferences,
    this.fruits,
  });

  FruitResponseModel.fromJson(dynamic json) {
    imagesReferences = json['data']['imagesReferences'] != null
        ? json['data']['imagesReferences']
        : null;

    if (json['data']['fruits'] != null) {
      fruits = [];
      json['data']['fruits'].forEach((v) {
        fruits?.add(FruitModel.fromJson(v));
      });
    }
  }
}
