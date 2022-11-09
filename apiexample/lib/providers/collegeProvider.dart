import 'package:apiexample/models/college_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class CollegeProvider with ChangeNotifier {
  College? coll;
  var localdata;
  Future loadCollege() async {
    String cresponse = await rootBundle.loadString('json/college.json');
    final loadedData = json.decode(cresponse);
    print('loadedData$loadedData');
    College college = College.fomJson(loadedData);
    print('colleg');
    coll = college;
    notifyListeners();
    return college;
  }

  College? col_data;
  Future<void> getCollegeValues() async {
    col_data = await loadCollege();
    notifyListeners();
  }
}
