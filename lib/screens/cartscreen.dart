import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../widgets/cartitems.dart';

class CartScreen extends StatelessWidget {
  static const routeNames = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 20),
              ),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text('Place Order')),
              Chip(label: Text('\$${cart.totalAmount}')),
            ]),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: cart.itemcount,
                itemBuilder: (context, i) => CartItems(
                      cart.items.values.toList()[i].id,
                      cart.items.values.toList()[i].title,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].quantity,
                      cart.items.values.toList()[i].price,
                    ))),
      ]),
    );
  }
}
