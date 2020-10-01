import 'package:json_annotation/json_annotation.dart';

import 'package:pizza_delivery_api/application/entities/user.dart';

import 'order_items.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int id;
  final String paymentType;
  final String address;
  final List<OrderItems> items;
  
  Order({
    this.id,
    this.paymentType,
    this.address,
    this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
