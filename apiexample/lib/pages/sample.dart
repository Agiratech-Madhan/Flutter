import 'package:apiexample/pages/todopage.dart';
import 'package:apiexample/providers/page_provider.dart';
import 'package:provider/provider.dart';

import '../pages/Complexdata.dart';
import '../widgets/gridlist.dart';
import '../providers/providerexample.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/student.dart';
// import 'dart:convert';

import 'package:flutter/services.dart' as rootbundle;

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    GridListItems(),
    ComplexData(),
    TodoPage()
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ProviderExample>(context, listen: false).getvalues();
    Provider.of<PageProvider>(context, listen: false).getvalues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ApiExample'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
