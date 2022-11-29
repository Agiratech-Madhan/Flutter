import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/models/photomodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  Photos? photoData;
  bool isOkay = true;
  final uri = 'https://jsonplaceholder.typicode.com/photos';
  Future<Photos> loadphoto() async {
    try {
      final response = await http.get(
        Uri.parse(uri),
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
    // notifyListeners();
    print(x);
    Photo newValue;
    String actionId = (id == '0') ? '' : '/$id';
    final photoDataIndex =
        photoData!.photos!.indexWhere((element) => '${element.id}' == id);
    final methods = id == '0' ? http.post : http.put;
    try {
      final response = await methods(
        Uri.parse('$uri$actionId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: x,
      );
      print(response.body);
      newValue = Photo.fromJson(json.decode(response.body));
      (id == '0')
          ? photoData!.photos!.insert(0, newValue)
          : photoData!.photos![photoDataIndex] = photo;
      notifyListeners();
      return newValue;
    } catch (e) {
      throw CustomException(
          message: 'Faild to ${(id == '0') ? 'Create' : 'Update'}  Photos');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      final url = Uri.parse('$uri/$id');
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
 // Future<Photo> createAlbum(Photo photo, String id) async {
  //   try {
  //     var x = json.encode(photo.toJson());
  //     final response = await http.post(
  //       Uri.parse(uri),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: x,
  //     );
  //     var newValue = Photo.fromJson(jsonDecode(response.body));
  //     photoData!.photos!.add(newValue);
  //     notifyListeners();
  //     return newValue;
  //   } catch (e) {
  //     throw CustomException(message: 'Faild to Create  Photos');
  //   }
  // }

  // Future<Photo> updateAlbum(Photo photo, int id) async {
  //   try {
  //     var x = json.encode(photo.toJson());
  //     final photoDataIndex =
  //         photoData!.photos!.indexWhere((element) => element.id == id);

  //     final responses = await http.put(
  //       Uri.parse('$uri/$id'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: x,
  //     );
  //     var updatevalue = Photo.fromJson(jsonDecode(responses.body));
  //     photoData!.photos![photoDataIndex] = photo;

  //     notifyListeners();

  //     return updatevalue;
  //   } catch (e) {
  //     throw CustomException(message: ' Failed to update data');
  //   }
  // }