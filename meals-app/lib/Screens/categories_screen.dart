import 'package:flutter/material.dart';
import '../dummy.dart';
import '../Widgets/categoryItem.dart';

class CategoryScreen extends StatelessWidget {
  // const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: DUMMY_CATEGORIES
          .map((catedata) =>
              Category_Item(catedata.id, catedata.title, catedata.color))
          .toList(),
    );
  }
}
