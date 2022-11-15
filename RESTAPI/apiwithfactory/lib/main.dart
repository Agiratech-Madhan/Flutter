import 'package:apiwithfactory/pages/homepage.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
import 'package:apiwithfactory/widgets/editphoto.dart';
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
