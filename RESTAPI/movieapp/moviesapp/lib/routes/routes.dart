import 'package:flutter/material.dart';
import '../pages/detailPage/detail_page.dart';
import '../pages/homePage/home_page.dart';

const homePage = '/home-page';
const detailPage = '/detail-page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    case detailPage:
      var data = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (context) => DetailPage(index: data['index'], id: data['id']),
      );
    default:
      throw ('this is not a route name');
  }
}
