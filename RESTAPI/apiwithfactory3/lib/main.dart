import '../pages/homepage.dart';
import '../provider/photoprovider.dart';
import '../widgets/editphoto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PhotoProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {EditPhoto.routeName: (context) => EditPhoto()},
      // TodoPage()),
    ),
  ));
}
