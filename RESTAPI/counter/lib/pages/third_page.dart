import 'package:counter/provider/data_provider.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;

import 'package:provider/provider.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(route.fourthPage);
              },
              icon: const Icon(Icons.arrow_forward))
        ],
        title: Text('ThirdPage'),
      ),
      body: Center(child: Text('Counter Value  ${value.countValue}')),
    );
  }
}
