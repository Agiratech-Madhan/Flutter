import 'package:apiexample/models/photo_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class PhotoProvider with ChangeNotifier {
  Future<Photos> loadphoto() async {
    String response = await rootBundle.loadString('json/photo.json');
    final data = json.decode(response);
    Photos photo = Photos.fromJson(data);
    print('photosload${photo.photos}');
    return photo;
  }

  Photos? photodata;
  Future<void> getvalues() async {
    final response = await loadphoto();
    photodata = response;
    notifyListeners();
  }
}
