import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtererd list"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Madhan'),
      ),
    );
  }
}
