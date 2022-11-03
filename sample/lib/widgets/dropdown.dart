import 'package:flutter/material.dart';

void main() {
  runApp(Drop());
}

class Drop extends StatefulWidget {
  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  // const Drop({super.key});
  List<String> Countries = ["india", "canada", "Uk"];
  String C_value = "india";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: DropdownButton<String>(
              value: C_value,
              icon: Icon(Icons.arrow_downward),
              onChanged: (dynamic newvalue) {
                setState(() {
                  C_value = newvalue;
                });
              },
              items: Countries.map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
