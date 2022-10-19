import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';
import '../Screens/categories_screen.dart';
import '../Screens/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoryScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Favourite'}
  ];

  void _selectPage(int index) {
    setState(() {
      _selected = index;
    });
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
