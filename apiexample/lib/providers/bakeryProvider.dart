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
    print('bakerydata${bakerydata.batters!.bid}');
    return bakerydata;
  }

  Bakery? bakeryItems;
  Future<void> getBakeryValues() async {
    bakeryItems = await loadbakery();
    print('getvalues${bakeryItems!.batters!.btype}');
    notifyListeners();
  }

  Bakery? get BakeryItem {
    print('bakeryItems$bakeryItems');
    return bakeryItems;
  }

  Future loadbakeries() async {
    String loadedaddress = await rootBundle.loadString('json/bakery.json');
    final jsonvalues = json.decode(loadedaddress) as List<dynamic>;
    print('jsonvalues${jsonvalues}');
    List<Bakery> bakerydata =
        jsonvalues.map((e) => Bakery.fromJson(e)).toList();
    print('bakerydata${bakerydata[0].batters!.bid}');
    return bakerydata;
  }

  List<Bakery>? bakeriesItems;
  Future<void> getBakeriesValues() async {
    bakeriesItems = await loadbakeries();
    print('getvalues${bakeriesItems![0].batters!.bid}');
    notifyListeners();
  }

  Bakery? get BakeriesItem {
    print('bakeryItems$bakeryItems');
    return bakeryItems;
  }
}
