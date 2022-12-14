import 'package:json_annotation/json_annotation.dart';

import 'package:greengrocer/src/models/cart_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id;
  @JsonKey(name: 'createdAt')
  DateTime? createdDateTime;

  @JsonKey(name: 'due')
  DateTime overdueDateTime;

  @JsonKey(defaultValue: [])
  List<CartItemModel> itemsCart;

  String status;

  String qrCodeImage;

  @JsonKey(name: 'copiaecola')
  String copyAndPaste;

  double total;

  OrderModel({
    required this.id,
    this.createdDateTime,
    required this.overdueDateTime,
    required this.itemsCart,
    required this.status,
    required this.qrCodeImage,
    required this.copyAndPaste,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  String toString() {
    return 'OrderModel(id: $id, createdDateTime: $createdDateTime, overdueDateTime: $overdueDateTime, itemsCart: $itemsCart, status: $status, qrCodeImage: $qrCodeImage, copyAndPaste: $copyAndPaste, total: $total)';
  }
}
