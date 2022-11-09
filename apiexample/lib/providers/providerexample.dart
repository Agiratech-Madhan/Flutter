import '../models/student.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' as rootbundle;

class ProviderExample with ChangeNotifier {
  List<Student> listItems = [];
  List<Student> slist = [];
  Future<List<Student>> studentjson() async {
    final jsondata =
        await rootbundle.rootBundle.loadString('json/student.json');
    final list = json.decode(jsondata) as List<dynamic>;
    listItems = list.map((data) => Student.fromJson(data)).toList();
    print(listItems);
    return listItems;
  }

  Future<void> getvalues() async {
    final response = await studentjson();
    slist = response;
    // print(slist);
    notifyListeners();
  }

  List<Student> get sitem {
    return slist;
  }

  @override
  notifyListeners();
}
