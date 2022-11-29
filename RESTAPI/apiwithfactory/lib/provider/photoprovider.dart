import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/models/photomodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  Photos? photoData;
  bool isOkay = true;
  Future<Photos> loadphoto() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'),
      );
      Photos x = Photos.fromJson(jsonDecode(response.body));
      photoData = x;
      notifyListeners();
      return photoData!;
    } catch (e) {
      throw CustomException(message: 'Failed to load Photos');
    }
  }

  Future<void> getvalues() async {
    final response = await loadphoto();
    photoData = response;
    notifyListeners();
  }

  Future<Photo> createAndUpdate(Photo photo, String id) async {
    var x = json.encode(photo.toJson());
    var newValue;
    final photoDataIndex =
        photoData!.photos!.indexWhere((element) => element.id == id);

    try {
      if (id == '') {
        final response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/photos'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: x,
        );
        newValue = Photo.fromJson(jsonDecode(response.body));
        photoData!.photos!.add(newValue);
      } else {
        final responses = await http.put(
          Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: x,
        );
        newValue = Photo.fromJson(jsonDecode(responses.body));
        photoData!.photos![photoDataIndex] = photo;
      }
      notifyListeners();
      return newValue;
    } catch (e) {
      throw CustomException(
          message: 'Faild to ${(id == '') ? 'Create' : 'Update'}  Photos');
    }
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
      photoData!.photos!.add(newValue);
      notifyListeners();
      return newValue;
    } catch (e) {
      throw CustomException(message: 'Faild to Create  Photos');
    }
  }

  Future<Photo> updateAlbum(Photo photo, int id) async {
    try {
      var x = json.encode(photo.toJson());
      final photoDataIndex =
          photoData!.photos!.indexWhere((element) => element.id == id);

      final responses = await http.put(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: x,
      );
      var updatevalue = Photo.fromJson(jsonDecode(responses.body));
      photoData!.photos![photoDataIndex] = photo;

      notifyListeners();

      return updatevalue;
    } catch (e) {
      throw CustomException(message: ' Failed to update data');
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/photos/$id');
      final photoDataIndex =
          photoData!.photos!.indexWhere((element) => element.id == id);
      await http.delete(url);
      photoData!.photos!.removeAt(photoDataIndex);
      notifyListeners();
    } catch (e) {
      throw CustomException(message: ' Failed to delete Photos');
    }
  }
}
