import 'package:flutter/material.dart';

class Sixthpage extends StatefulWidget {
  const Sixthpage({super.key});

  @override
  State<Sixthpage> createState() => _SixthpageState();
}

class _SixthpageState extends State<Sixthpage> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 200,
        child: ReorderableListView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          children: [
            for (int index = 0; index < _items.length; index++)
              ListTile(
                key: Key(index.toString()),
                title: Text('Item ${_items[index]}'),
              ),
          ],
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
