import 'package:equatable/equatable.dart';

class FruitModel extends Equatable {
  String? name;
  int? price;

  FruitModel({
    this.name,
    this.price,
  });

  FruitModel.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    return map;
  }

  @override
  List<Object> get props => [name!, price!];
}
