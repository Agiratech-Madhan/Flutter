import 'package:apiexample/providers/page_provider.dart';
import 'package:apiexample/providers/todo_provider.dart';

import './providers/providerexample.dart';
import './pages/sample.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => ProviderExample())),
          ChangeNotifierProvider(create: ((context) => PageProvider())),
          ChangeNotifierProvider(create: ((context) => TodoProvider())),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: Sample())),
  );
}
