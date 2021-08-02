
import 'package:flutter/foundation.dart';

import 'package:boutique_flutter/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dt;

  OrderItem({required this.id, required this.amount, required this.products, required this.dt});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cardProducts, double total) {
    _orders.insert(0, OrderItem(id: DateTime.now().toString(), amount: total, dt: DateTime.now(), products: cardProducts));
    notifyListeners();
  }
}