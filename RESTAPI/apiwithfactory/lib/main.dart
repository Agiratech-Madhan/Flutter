import 'package:apiwithfactory/pages/homepage.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PhotoProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // TodoPage()),
    ),
  ));
}
