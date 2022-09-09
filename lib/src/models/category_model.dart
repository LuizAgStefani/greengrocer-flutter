// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:greengrocer/src/models/item_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String title;
  String id;
  @JsonKey(defaultValue: [])
  List<ItemModel> itens;
  @JsonKey(defaultValue: 0)
  int pagination;

  CategoryModel({
    required this.title,
    required this.id,
    required this.itens,
    required this.pagination,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() {
    return 'CategoryModel(title: $title, id: $id, itens: $itens, pagination: $pagination)';
  }
}
