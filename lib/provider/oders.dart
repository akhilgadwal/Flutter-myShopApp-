import 'package:flutter/material.dart';
import 'package:myshop/provider/cart.dart';

class OrderItems {
  final String id;
  final double price;
  final List<CartItem> products;
  final DateTime datetime;

  OrderItems({
    required this.id,
    required this.price,
    required this.products,
    required this.datetime,
  });
}

class Order with ChangeNotifier {
  List<OrderItems> _orders = [];

  // creating getter
  List<OrderItems> get orders {
    return [..._orders];
  }

  void addOrders(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItems(
        id: DateTime.now().toString(),
        price: total,
        products: cartProducts,
        datetime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
