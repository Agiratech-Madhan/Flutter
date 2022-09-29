import 'package:flutter/material.dart';
import './dummy.dart';
import 'categoryItem.dart';

class CategoryScreen extends StatelessWidget {
  // const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mealshop"),
      ),
      body: GridView(
          padding: const EdgeInsets.all(15),
          children: DUMMY_CATEGORIES
              .map((catedata) => Category_Item(catedata.title, catedata.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          )),
    );
  }
}
