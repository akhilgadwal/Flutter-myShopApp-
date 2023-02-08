import 'package:flutter/material.dart';
import 'package:myshop/provider/cart.dart';
import 'package:myshop/provider/oders.dart';
import 'package:myshop/provider/products.dart';
import 'package:myshop/screens/cartscreen.dart';
import 'package:myshop/screens/prodcuts_detail.dart';
import 'package:myshop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //crearting multiple provider for using them in dif screen
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Order()),
      ],
      child: MaterialApp(
        title: 'Apni-Dukna',
        debugShowCheckedModeBanner: false,
        home: const ProdcutsOverviewScreen(),
        theme: ThemeData(primarySwatch: Colors.purple),
        routes: {
          ProductsDetails.routeNames: (context) => const ProductsDetails(),
          CartScreen.routeNames: (context) => const CartScreen(),
        },
      ),
    );
  }
}
