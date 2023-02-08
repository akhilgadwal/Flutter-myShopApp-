import 'package:flutter/material.dart';
import 'package:myshop/provider/cart.dart';
import 'package:myshop/screens/cartscreen.dart';
import 'package:provider/provider.dart';
import '../widgets/products_girds.dart';

// ignore: camel_case_types
enum filterSoptions {
  // ignore: constant_identifier_names
  Favourite,
  // ignore: constant_identifier_names
  All,
}

class ProdcutsOverviewScreen extends StatefulWidget {
  const ProdcutsOverviewScreen({super.key});

  @override
  State<ProdcutsOverviewScreen> createState() => _ProdcutsOverviewScreenState();
}

class _ProdcutsOverviewScreenState extends State<ProdcutsOverviewScreen> {
  var showonlyfav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          // const Icon(Icons.shopping_cart),
          PopupMenuButton(
            onSelected: (filterSoptions selectedValues) {
              setState(() {
                if (selectedValues == filterSoptions.Favourite) {
                  showonlyfav = true;
                } else {
                  showonlyfav = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: filterSoptions.Favourite,
                child: Text('Only Fav'),
              ),
              const PopupMenuItem(
                value: filterSoptions.All,
                child: Text('show All'),
              )
            ],
          ),
          // Consumer<Cart>(builder: (_, cart, child) => Badge())
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              label: Text(
                cart.itemcount.toString(),
              ),
              child: child,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeNames);
              },
            ),
          ),
        ],
      ),
      body: Productsgird(showonlyfav),
    );
  }
}
