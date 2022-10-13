import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: ((context, index) => Container(
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.lock),
                      title: Text('Ak Vignesh'),
                    ),
                  )))),
    );
  }
}
