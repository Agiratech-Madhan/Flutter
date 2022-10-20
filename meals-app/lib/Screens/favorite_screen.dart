// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/mealitem.dart';

import 'package:meals_app/models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  const FavouriteScreen({
    Key? key,
    required this.favoritesMeals,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return const Center(child: Text('You have no favorites'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imageUrl: favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            complexity: favoritesMeals[index].complexity,
            affordability: favoritesMeals[index].affordability,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
