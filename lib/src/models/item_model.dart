import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;
  @JsonKey(name: 'title')
  String itemName;
  @JsonKey(name: 'picture')
  String img;
  String unit;
  double price;
  String description;

  ItemModel({
    this.id = '',
    required this.itemName,
    required this.img,
    required this.unit,
    required this.price,
    required this.description,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel(id: $id, itemName: $itemName, img: $img, unit: $unit, price: $price, description: $description)';
  }
}
