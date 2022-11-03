import 'package:flutter/material.dart';

class ContainerExample extends StatefulWidget {
  const ContainerExample({super.key});

  @override
  State<ContainerExample> createState() => _ContainerExampleState();
}

class _ContainerExampleState extends State<ContainerExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                color: Colors.grey[200],
                // decoration: BoxDecoration(color: Colors.yellow),
                child: Text(
                  "sample hello container",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 120,
                // dimension: 50,
                child: Text("SizedBox"),
              ),
              // ConstrainedBox(constraints: BoxConstraints.expand()),
            ],
          ),
        ),
      ),
    );
  }
}
