import 'package:apiexample/models/shapeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ShapeProvider with ChangeNotifier {
  Future<Shape> loadShape() async {
    String res = await rootBundle.loadString('json/shape.json');
    final response = json.decode(res);
    Shape? shape = Shape.fromJson(response);
    return shape;
  }

  Shape? shapeData;
  Future<void> getValues() async {
    final data = await loadShape();
    shapeData = data;
    notifyListeners();
  }
}
