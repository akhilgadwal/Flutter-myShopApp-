import 'package:flutter/material.dart';

import 'package:myshop/widgets/products_item.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class Productsgird extends StatelessWidget {
  final bool showonlyfav;
  const Productsgird(this.showonlyfav, {super.key});

  // final List<ProductsModel> loadedProductsData;
  // const Productsgird(this.loadedProductsData, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final product = showonlyfav ? productsdata.showFav : productsdata.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: product[i],
        child: const ProductItem(),
      ),
      itemCount: product.length,
    );
  }
}
