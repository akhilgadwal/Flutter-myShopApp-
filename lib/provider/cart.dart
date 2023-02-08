import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};
  //create a getter

  Map<String, CartItem> get items {
    return {..._items};
  }

  //getter
  int get itemcount {
    return _items.length;
  }

  double get totalAmount {
    var totalamount = 0.0;
    _items.forEach((key, CartItem) {
      totalamount += CartItem.price * CartItem.quantity;
    });
    return totalamount;
  }

  //function for creating to additems to cart
  void addItemsToCart(String productId, String title, double price,
      {required String id}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exCartItem) => CartItem(
                id: exCartItem.id,
                title: exCartItem.title,
                price: exCartItem.price,
                quantity: exCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  //functon for removing a itme
  void removeitem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
