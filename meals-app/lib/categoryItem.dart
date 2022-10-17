import 'package:flutter/material.dart';
import 'package:meals_app/category_Meals_Screen.dart';

class Category_Item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  Category_Item(this.id, this.title, this.color);
  void selectcategory(BuildContext context_) {
    Navigator.of(context_)
        .pushNamed('/category-meals', arguments: {'id': id, 'tittle': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
