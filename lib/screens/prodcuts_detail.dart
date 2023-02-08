import 'package:flutter/material.dart';
import 'package:myshop/provider/products.dart';
import 'package:provider/provider.dart';

class ProductsDetails extends StatelessWidget {
  // final String title;
  static const routeNames = ('Products_details');

  const ProductsDetails({super.key});
  // const ProductsDetails(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProducts = Provider.of<Products>(
      context,
    ).getbyId(productsId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedProducts.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Chip(label: Text('\$ ${loadedProducts.price}')),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.purple),
            child: Center(
              child: Text(
                '${loadedProducts.description}',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
