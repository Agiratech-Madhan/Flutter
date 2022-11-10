import 'package:apiexample/models/product_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ProductProvider with ChangeNotifier {
  Future<Product> loadProduct() async {
    String res = await rootBundle.loadString('json/product.json');

    final response = json.decode(res);
    Product? product = Product.fromJson(response);
    return product;
  }

  Product? productData;

  Future<void> getValues() async {
    final productresponse = await loadProduct();
    productData = productresponse;
    notifyListeners();
  }
}
