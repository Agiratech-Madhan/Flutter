import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(route.thirdPage);
              },
              icon: Icon(Icons.arrow_forward))
        ],
        title: Text('SecondPage'),
      ),
    );
  }
}
