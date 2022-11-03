import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Popupmenu extends StatefulWidget {
  const Popupmenu({super.key});

  @override
  State<Popupmenu> createState() => _PopupmenuState();
}

class _PopupmenuState extends State<Popupmenu> {
  String? _selection;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _selection = value;
              });
            },
            child: ListTile(
              subtitle: Column(
                children: <Widget>[
                  Text('Sub title'),
                  Text(_selection == null
                      ? 'Nothing selected yet'
                      : _selection.toString()),
                ],
              ),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Value1',
                child: Text('Choose value 1'),
              ),
              const PopupMenuItem<String>(
                value: 'Value2',
                child: Text('Choose value 2'),
              ),
              const PopupMenuItem<String>(
                value: 'Value3',
                child: Text('Choose value 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
