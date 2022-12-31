import 'package:shopping_app/models/cart_model.dart';

class OrderItem {
  final String id;
  final double totalAmount;
  final List<CartItem> products;
  final DateTime time;

  OrderItem(
      {required this.id,
      required this.totalAmount,
      required this.products,
      required this.time});
}
