import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapicrud/screens/editScreen.dart';
import './providers/detailsprovider.dart';
import './screens/homeScreen.dart';
import '../routes/routes.dart' as route;

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),

        // routes: {EditScreen.routeName: (context) => const EditScreen()},
        onGenerateRoute: route.controller,
      )));
}
