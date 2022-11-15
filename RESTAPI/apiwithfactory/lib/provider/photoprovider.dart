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

  Future<Photo> updateAlbum(Photo photo, int id) async {
    var x = json.encode(photo.toJson());
    final responses = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: x,
    );

    print(responses.statusCode);
    if (responses.statusCode == 200) {
      print(photodata);

      print(responses.body);
      var updatevalue = Photo.fromJson(jsonDecode(responses.body));
      notifyListeners();
      return updatevalue;
    } else {
      throw Exception('Failed to update album.');
    }
  }
}
