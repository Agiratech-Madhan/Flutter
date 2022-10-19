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
    final categoryid = routeArgs['id'];
    final categorytitle = routeArgs['title'];
    print(categorytitle);

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryid))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(categorytitle.toString()),
            // Text(categorytitle.toString()),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
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
