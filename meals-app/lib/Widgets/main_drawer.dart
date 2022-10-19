import 'package:flutter/material.dart';
import 'package:meals_app/Screens/filter_screen.dart';
import 'package:meals_app/Screens/tab_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
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
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => TabsScreen()));
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
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
