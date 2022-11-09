import 'package:apiexample/providers/address_provider.dart';
import 'package:apiexample/providers/bakeryProvider.dart';
import 'package:apiexample/providers/collegeProvider.dart';
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
          ChangeNotifierProvider(create: ((context) => AddressProvider())),
          ChangeNotifierProvider(create: ((context) => Bakeryprovider())),
          ChangeNotifierProvider(create: ((context) => CollegeProvider())),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: Sample())),
  );
}
