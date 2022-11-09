import 'package:apiexample/models/address_model.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AddressProvider with ChangeNotifier {
  Future loadadress() async {
    String jsonAddress = await rootBundle.loadString('json/address.json');
    final jsonResponse = json.decode(jsonAddress);
    Address address = Address.fromJson(jsonResponse);
    print(address.streets![1]);
    return address;
  }

  Address? alist;
  Future<void> getvalues() async {
    alist = await loadadress();
    print('alist$alist');
    notifyListeners();
  }
}
