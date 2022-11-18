import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/detailsprovider.dart';
import './screens/homeScreen.dart';
import '../routes/routes.dart' as route;

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        onGenerateRoute: route.controller,
      )));
}
