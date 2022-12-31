import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String id;

  CartItemWidget(
      {required this.productId,
      required this.id,
      required this.title,
      required this.quantity,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      onDismissed: (direction) {
        cart.removeFromCart(productId);
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        padding: const EdgeInsets.only(
          right: 8,
        ),
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(
                      "Total: ${price * quantity}/-",
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "$price/-",
                    ),
                    Text("${quantity}X"),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
