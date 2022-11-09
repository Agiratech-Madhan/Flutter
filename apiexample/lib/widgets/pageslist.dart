import 'package:apiexample/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    final values = Provider.of<PageProvider>(context);

    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.10,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: values.items.length,
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text(values.items[index].page.toString())),
              ))),
    );
  }
}
