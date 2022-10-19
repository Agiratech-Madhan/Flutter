import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('sample',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant),
          buildListTile('Filters', Icons.settings)
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon) {
    return ListTile(
      onTap: (() {}),
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
