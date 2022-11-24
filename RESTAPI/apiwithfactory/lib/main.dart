import '../pages/homepage.dart';
import '../provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/show_dialog.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PhotoProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        sample: ShowDialog(),
      ),
    ),
  ));
}
