import 'package:flutter/material.dart';

class Category_Item extends StatelessWidget {
  // const Category_Item({super.key});
  final String title;
  final Color color;
  Category_Item(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
