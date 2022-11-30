import 'package:counter/provider/data_provider.dart';
import 'package:flutter/material.dart';

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
        title: Text('ThirdPage'),
      ),
      body: Center(child: Text(value.countValue.toString())),
    );
  }
}
