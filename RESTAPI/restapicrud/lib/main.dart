import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/detailsprovider.dart';
import './screens/homeScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomeScreen())));
}
