import 'package:flutter/cupertino.dart';
import 'package:shopping_app/models/cart_model.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int getNumbersOfItemsInCart() {
    return _items.length;
  }

  double getTotalAmount() {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.qauntity * value.price;
    });
    return total;
  }

  void addToCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existstingCartItem) => CartItem(
            id: existstingCartItem.id,
            title: existstingCartItem.title,
            price: existstingCartItem.price,
            qauntity: existstingCartItem.qauntity + 1),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            qauntity: 1),
      );
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
