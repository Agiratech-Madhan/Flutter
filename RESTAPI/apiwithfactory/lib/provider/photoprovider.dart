import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/models/photomodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  Photos? photodata;
  bool isOkay = true;
  Future<Photos> loadphoto() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'),
      );

      Photos x = Photos.fromJson(jsonDecode(response.body));
      photodata = x;
      notifyListeners();
      return photodata!;
    } catch (e) {
      throw CustomException(message: 'Failed to load Photos');
    }
  }

  Future<void> getvalues() async {
    final response = await loadphoto();
    photodata = response;
    notifyListeners();
  }

  Future<Photo> createAlbum(Photo photo, String id) async {
    try {
      var x = json.encode(photo.toJson());
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: x,
      );
      var newValue = Photo.fromJson(jsonDecode(response.body));
      photodata!.photos!.add(newValue);
      notifyListeners();
      return newValue;
    } catch (e) {
      throw CustomException(message: 'Faild to Create  Photos');
    }
  }

  Future<Photo> updateAlbum(Photo photo, int id) async {
    try {
      var x = json.encode(photo.toJson());
      final photodataIndex =
          photodata!.photos!.indexWhere((element) => element.id == id);

      final responses = await http.put(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: x,
      );
      var updatevalue = Photo.fromJson(jsonDecode(responses.body));
      photodata!.photos![photodataIndex] = photo;

      notifyListeners();

      return updatevalue;
    } catch (e) {
      throw CustomException(message: ' Failed to update data');
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final url = Uri.parse('https://jsonpler.typicode.com/photos/$id');
      final photodataIndex =
          photodata!.photos!.indexWhere((element) => element.id == id);
      await http.delete(url);
      photodata!.photos!.removeAt(photodataIndex);
      notifyListeners();
    } catch (e) {
      throw CustomException(message: ' Failed to delete Photos');
    }
  }
}
