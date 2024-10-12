import 'package:flutter/material.dart';

enum OrderEnums {
  inProgress(
    status: "In Progress",
    color: Colors.red,
  ),
  delivered(
    status: "Delivered",
    color: Colors.green,
  );

  final String status;
  final Color color;

  const OrderEnums({
    required this.status,
    required this.color,
  });
}

class OrderModel {
  final int id;
  final OrderEnums status;

  static OrderModel get order {
    return OrderModel(id: 1, status: OrderEnums.inProgress);
  }

  OrderModel({
    required this.id,
    required this.status,
  });

  OrderModel copyWith({int? id, OrderEnums? status}) {
    return OrderModel(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }
}
