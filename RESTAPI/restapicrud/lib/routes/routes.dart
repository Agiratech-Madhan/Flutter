import 'package:flutter/material.dart';
import 'package:restapicrud/screens/editScreen.dart';
import 'package:restapicrud/screens/homeScreen.dart';

const editUser = '/edit-user';
const homePage = '/home-page';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case editUser:
      var data = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(builder: (context) {
        return EditScreen(
            id: data['id'],
            isAdd: data['isAdd'],
            showMessage:
                // HomeScreen.showMessage();
                data['showMessage']);
      });
    default:
      throw ('this is not a route name');
  }
}
