import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/mealitem.dart';
import 'package:meals_app/models/category.dart';
import '../dummy.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String id;
  // final String title;
  // CategoryMealsScreen(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryid = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where(((meal) => meal.categories.contains(categoryid)))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
