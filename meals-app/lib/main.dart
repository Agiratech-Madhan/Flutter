import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_Meals_Screen.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';
import './Screens/category_Meals_Screen.dart';
import './Screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primaryAccentColor = Colors.blue;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          // accentColor: Colors.lightBlue,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryAccentColor),

          canvasColor: Color.fromRGBO(255, 254, 228, 1),
          fontFamily: 'Raleway',
          // textTheme: ThemeData.light().textTheme,
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ), // TextStyle
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ), // TextStyle
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: ' RobotoCondensed ',
                fontWeight: FontWeight.bold,
              )), // TextStyle
        ),
        // home: CategoryScreen(),
        initialRoute: '/ ',
        routes: {
          '/': (context) => CategoryScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen()
        },
        // onGenerateRoute: (settings) {
        //   print(settings.name);
        //   // return settings.name;
        // },
        onUnknownRoute: ((settings) =>
            MaterialPageRoute(builder: (context) => CategoryScreen())));
  }
}
