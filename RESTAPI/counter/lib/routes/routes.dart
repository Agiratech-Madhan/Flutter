import 'package:counter/home_page.dart';
import 'package:counter/pages/fifth_page.dart';
import 'package:counter/pages/fourth_page.dart';
import 'package:counter/pages/second_page.dart';
import 'package:counter/pages/seventh_page.dart';
import 'package:counter/pages/sixth_page.dart';
import 'package:counter/pages/third_page.dart';
import 'package:flutter/material.dart';

const homePage = '/home-page';
const secondPage = '/second-page';
const thirdPage = '/third-page';
const fourthPage = '/fourth-page';
const fifthPage = '/fifth-page';
const sixthPage = '/sixth-page';
const seventhPage = '/seven-page';
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case secondPage:
      return MaterialPageRoute(builder: (context) => const SecondPage());
    case thirdPage:
      return MaterialPageRoute(builder: (context) => const ThirdPage());
    case fourthPage:
      return MaterialPageRoute(builder: (context) => const FourthPage());
    case fifthPage:
      return MaterialPageRoute(builder: (context) => const FifthPage());
    case sixthPage:
      return MaterialPageRoute(builder: (context) => const Sixthpage());
    case seventhPage:
      return MaterialPageRoute(builder: (context) => SeventhPage());
    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
