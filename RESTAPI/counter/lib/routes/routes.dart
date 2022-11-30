import 'package:counter/home_page.dart';
import 'package:counter/pages/second_page.dart';
import 'package:counter/pages/third_page.dart';
import 'package:flutter/material.dart';

const homePage = '/home-page';
const secondPage = '/second-page';
const thirdPage = '/third-page';
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case secondPage:
      return MaterialPageRoute(builder: (context) => const SecondPage());
    case thirdPage:
      return MaterialPageRoute(builder: (context) => const ThirdPage());
    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
