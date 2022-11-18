import 'package:flutter/material.dart';
import 'package:restapicrud/screens/editScreen.dart';
import 'package:restapicrud/screens/homeScreen.dart';

const editUser = '/edit-user';
const r_home_page = '/home-page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case r_home_page:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    case editUser:
      var data = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (context) {
        return EditScreen(id: data['id'], isAdd: data['isAdd']);
      });
    default:
      throw ('this is not a route name');
  }
}
