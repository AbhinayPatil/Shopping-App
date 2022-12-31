import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

import '../models/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: true);
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: GridTile(
          footer: Container(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.redAccent,
                  ),
                  onTap: () {
                    product.changeFavoriteStatus();
                  },
                ),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: () {
                    cart.addToCart(product.id, product.title, product.price);
                  },
                ),
              ],
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetails.routeName, arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
