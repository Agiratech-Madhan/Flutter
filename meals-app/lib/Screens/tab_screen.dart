// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';

import '../Screens/categories_screen.dart';
import '../Widgets/main_drawer.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({super.key});
  final List<Meal> favoriteMeals;
  const TabsScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];

  void _selectPage(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(favoritesMeals: widget.favoriteMeals),
        'title': 'Favourite'
      }
    ];
    super.initState();
  }

  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selected]['title'].toString()),
      ),
      drawer: MainDrawer(),
      body: _pages[_selected]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selected,
          // type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.lightBlue,
                icon: Icon(Icons.category),
                label: 'Category'),
            BottomNavigationBarItem(
                backgroundColor: Colors.lightBlue,
                icon: Icon(Icons.star),
                label: 'Favourite')
          ]),
    );
  }
}
