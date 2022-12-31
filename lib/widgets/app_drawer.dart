import 'package:flutter/material.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/screens/products_display_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome User!!!",
              style: TextStyle(fontSize: 20),
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              child: ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text(
                  "Shop",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, ProductsDisplay.routeName),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ListTile(
                leading: const Icon(Icons.shopping_cart_checkout),
                title: const Text(
                  "My Orders",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, OrdersScreen.routeName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
