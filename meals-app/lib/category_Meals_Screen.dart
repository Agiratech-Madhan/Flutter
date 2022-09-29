import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const CategoryMealsScreen({super.key});
  final String id;
  final String title;
  CategoryMealsScreen(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("receipies page"),
      ),
      body: Center(child: Text("main recepies content")),
    );
  }
}
