import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/badge.dart';

import '../widgets/product_tile.dart';

class ProductsDisplay extends StatefulWidget {
  const ProductsDisplay({super.key});
  static const routeName = "products-display";

  @override
  State<ProductsDisplay> createState() => _ProductsDisplayState();
}

class _ProductsDisplayState extends State<ProductsDisplay> {
  var showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) => Badge(
              value: value.getNumbersOfItemsInCart().toString(),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    CartScreen.routeName,
                  );
                },
              ),
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (int value) {
              if (value == 0) {
                setState(() {
                  showOnlyFavorites = true;
                });
              } else if (value == 1) {
                setState(() {
                  showOnlyFavorites = false;
                });
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 0,
                child: Text("My Favorites"),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text('Show All'),
              ),
            ],
          ),
        ],
        title: showOnlyFavorites
            ? const Text("My Favorites")
            : const Text("Shopping App"),
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(showFav: showOnlyFavorites),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  final bool showFav;
  const ProductsGrid({super.key, required this.showFav});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showFav ? productData.favoriteItems : productData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: ((context, index) => ChangeNotifierProvider.value(
            value: products[index],
            child: const ProductTile(),
          )),
      itemCount: products.length,
    );
  }
}
