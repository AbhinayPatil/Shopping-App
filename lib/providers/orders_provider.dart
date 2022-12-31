import 'package:flutter/foundation.dart';
import 'package:shopping_app/models/order_model.dart';

import '../models/cart_model.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          totalAmount: total,
          products: cartProducts,
          time: DateTime.now()),
    );
    notifyListeners();
  }
}
