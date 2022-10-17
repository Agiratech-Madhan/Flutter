import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String title;
  // CategoryMealsScreen(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryid = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: Center(child: Text('$categoryid')),
    );
  }
}
