import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int qauntity;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.qauntity});
}
