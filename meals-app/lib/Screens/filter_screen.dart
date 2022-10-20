import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosfree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtererd list"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline5),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'gluten', 'Only glutenfree meal', _glutenfree, (value) {
                setState(() {
                  _glutenfree = value;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only Vegetarian meal', _vegetarian, (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              _buildSwitchListTile('vegan', 'Only vegan meal', _vegan, (value) {
                setState(() {
                  _vegan = value;
                });
              }),
              _buildSwitchListTile('lactos', 'Only lactos', _lactosfree,
                  (value) {
                setState(() {
                  _lactosfree = value;
                });
              })
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentvalue, Function updatevalue) {
    return SwitchListTile(
      value: currentvalue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updatevalue as Function(bool),
    );
  }
}
