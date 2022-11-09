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
  Future<void> getAddressValues() async {
    alist = await loadadress();
    print('alist$alist');
    notifyListeners();
  }

  Future<List<Address>> loadadresses() async {
    String jsonAddress = await rootBundle.loadString('json/addresses.json');
    final jsonResponse = json.decode(jsonAddress) as List<dynamic>;
    List<Address> address =
        jsonResponse.map((e) => Address.fromJson(e)).toList();
    return address;
  }

  List<Address>? alists;
  Future<void> getAddressesValues() async {
    final response = await loadadresses();
    alists = response;
    print('alists$alists');
    notifyListeners();
  }
}
