import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/pagemodel.dart';

class PageProvider with ChangeNotifier {
  List<PageModel> items = [];
  List<PageModel> pageItems = [];
  Future<List<PageModel>> pagejson() async {
    final jsondata = await rootBundle.loadString('json/page.json');
    final list = json.decode(jsondata) as List<dynamic>;
    items = list.map((data) => PageModel.fromJson(data)).toList();
    print(items);
    return items;
  }

  Future<void> getvalues() async {
    final response = await pagejson();
    pageItems = response;
    // print(slist);
    notifyListeners();
  }

  List<PageModel> get pageItem {
    return pageItems;
  }

  @override
  notifyListeners();
}
