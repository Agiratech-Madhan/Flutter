import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_Meals_Screen.dart';
import 'package:meals_app/Screens/filter_screen.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';
import 'package:meals_app/Screens/tab_screen.dart';
import 'package:meals_app/dummy.dart';
import 'package:meals_app/models/meal.dart';
import './Screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetarian': false
  };
  bool isMealFav(String id) {
    return favoritedMeal.any((element) => element.id == id);
  }

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoritedMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenfree) {
          return false;
        }
        if (_filters['lactos']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoritedMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoritedMeal.removeAt(existingIndex);
      });
    } else {
      favoritedMeal.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
    }
  }

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
          '/': (context) => TabsScreen(favoriteMeals: favoritedMeal),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(availableMeals: availableMeal),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(toggleFav: toggleFavorite, isMealFav: isMealFav),
          // FiltersScreen.routeName: (ctx) =>
          //     FiltersScreen(currentFilter: _filters, saveFilter: _setFilters),
        },
        onGenerateRoute: (settings) {
          print(settings.name);
          // return settings.name;
        },
        onUnknownRoute: ((settings) =>
            MaterialPageRoute(builder: (context) => CategoryScreen())));
  }
}
