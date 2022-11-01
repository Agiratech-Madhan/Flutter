import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> orders_ = [];

  Orders({required this.authToken, required this.orders_});
  List<OrderItem> get orders {
    return [...orders_];
  }

  final String authToken;
  Future<void> fetchAndSetOrder() async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/orders.json?auth=$authToken');
    final response = await http.get(url);

    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData.isEmpty) {
      // print('empty');
      return;
    }
    print(extractedData);
    extractedData.forEach(((key, orderData) {
      loadedOrders.add(OrderItem(
        //(json['name'] ?? '').toString();
        id: key,
        amount: orderData['amount'],
        dateTime: DateTime.parse(orderData['dateTime']),
        products: (orderData['products'] as List<dynamic>).map((item) {
          return CartItem(
            id: 'id',
            price: item['price'],
            quantity: item['quantity'],
            title: item['title'],
          );
        }).toList(),
      ));
    }));
    orders_ = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(
    List<CartItem> cartProducts,
    double total,
  ) async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/orders.json?auth=$authToken');
    final DateTime timestamp = DateTime.now();
    final response = await http.post(url,
        body: json.encode({
          'amount': total,
          'dateTime': DateTime.now().toIso8601String(),
          'products': cartProducts
              .map((e) => {
                    'id': e.id,
                    'title': e.title,
                    'quantity': e.quantity,
                    'price': e.price
                  })
              .toList()
        }));
    orders_.insert(
        0,
        OrderItem(
            id: json.decode(response.body)['name'],
            amount: total,
            products: cartProducts,
            dateTime: timestamp));
    notifyListeners();
  }
}
