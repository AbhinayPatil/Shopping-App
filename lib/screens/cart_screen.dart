import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders_provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("TOTAL"),
                    const Spacer(),
                    Chip(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      label: Text(
                        "Rs${cart.getTotalAmount().toString().split(".")[0]}${cart.getTotalAmount().toString().split(".")[1].substring(0, 1)}/- ",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final orderData =
                            Provider.of<Orders>(context, listen: false);
                        orderData.addOrder(
                            cart.items.values.toList(), cart.getTotalAmount());
                        cart.clearCart();
                        const snackBar = SnackBar(
                          content: Text("Your order was placed successfully"),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(
                        "Place Order",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListView.builder(
                    itemBuilder: ((context, index) => CartItemWidget(
                          productId: cart.items.keys.toList()[index],
                          id: cart.items.values.toList()[index].id,
                          title: cart.items.values.toList()[index].title,
                          quantity: cart.items.values.toList()[index].qauntity,
                          price: cart.items.values.toList()[index].price,
                        )),
                    itemCount: cart.items.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
