import 'package:apiwithfactory/models/photomodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  Future<Photos> loadphoto() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/'),
    );

    if (response.statusCode == 200) {
      return Photos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Photos? photodata;
  Future<void> getvalues() async {
    final response = await loadphoto();
    photodata = response;
    notifyListeners();
  }
}
