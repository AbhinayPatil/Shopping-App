import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders_provider.dart';

import '../widgets/order_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName = 'orders-screen';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItemWidget(
          orders: ordersData.orders[index],
        ),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
