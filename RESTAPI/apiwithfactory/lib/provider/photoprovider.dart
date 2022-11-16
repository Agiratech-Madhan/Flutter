import 'package:apiwithfactory/models/photomodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  Photos? photodata;
  // dynamic photodatas = [];

  Future<Photos> loadphoto() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/'),
    );

    if (response.statusCode == 200) {
      Photos x = Photos.fromJson(jsonDecode(response.body));
      photodata = x;

      notifyListeners();
      return x;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> getvalues() async {
    final response = await loadphoto();
    photodata = response;
    notifyListeners();
  }

  Future<Photo> createAlbum(Photo photo, String id) async {
    var x = json.encode(photo.toJson());
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: x,
    );

    if (response.statusCode == 201) {
      var newValue = Photo.fromJson(jsonDecode(response.body));
      photodata!.photos!.add(newValue);
      // photodatas.add(newValue);
      // photodata = photodatas;
      print('created value');
      // print(photodatas);
      // photodata.add(newValue);
      notifyListeners();
      return newValue;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<Photo> updateAlbum(Photo photo, int id) async {
    var x = json.encode(photo.toJson());
    final photodataIndex =
        photodata!.photos!.indexWhere((element) => element.id == id);
    print('updatevalue');

    // print(photodataIndex);
    // print(photodata!.photos![0].toString());
    // print(x);
    final responses = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: x,
    );
    print(responses.statusCode);
    print('before update');
    print(photodata!.photos![photodataIndex].title);
    // photodata!.photos![photodataIndex] = photo;
    // notifyListeners();
    print('new photo id');
    print(photo.title);
    // print('updated value');

    if (responses.statusCode == 200) {
      // print(photodata?.photos![0].id);
      print(responses.body);
      var updatevalue = Photo.fromJson(jsonDecode(responses.body));
      // photodata!.photos![photodataIndex] = photo;
      photodata!.photos![photodataIndex] = photo;
      // photodata!.photos![photodataIndex] = updatevalue;
      // notifyListeners();
      notifyListeners();
      print('object');
      print(photodata!.photos![photodataIndex].title);
      print('updated valuefsdfsfsf');

      print(updatevalue);
      return updatevalue;
    } else {
      throw Exception('Failed to update album.');
    }
  }

  Future<void> deleteUser(int id) async {
    final url = Uri.parse(
        'https://shop-app-4b081-default-rtdb.firebaseio.com/apicrud/$id.json');
    final photodataIndex =
        photodata!.photos!.indexWhere((element) => element.id == id);
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      photodata!.photos!.removeAt(photodataIndex);
      notifyListeners();
    }
    // final existPhoto = photodatas.indexWhere((element) => element.id == id);
  }
}
