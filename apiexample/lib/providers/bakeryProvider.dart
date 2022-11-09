import 'package:apiexample/models/bakery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Bakeryprovider with ChangeNotifier {
  Future loadbakery() async {
    String loadedaddress = await rootBundle.loadString('json/bakery.json');
    final jsonvalues = json.decode(loadedaddress);
    print('jsonvalues${jsonvalues}');
    Bakery bakerydata = Bakery.fromJson(jsonvalues);
    print('bakerydata${bakerydata}');
    return bakerydata;
  }

  Bakery? bakeryItems;
  Future<void> getBakeryValues() async {
    bakeryItems = await loadbakery();
    print('getvalues$bakeryItems');
    notifyListeners();
  }

  Bakery? get BakeryItem {
    print('bakeryItems$bakeryItems');
    return bakeryItems;
  }
}
