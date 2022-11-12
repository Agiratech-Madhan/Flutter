import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapicrud/screens/editScreen.dart';
import './providers/detailsprovider.dart';
import './screens/homeScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {EditScreen.routeName: (context) => EditScreen()},
      )));
}
