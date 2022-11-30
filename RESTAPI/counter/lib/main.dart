import 'package:counter/home_page.dart';
import 'package:counter/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes/routes.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        onGenerateRoute: route.controller,
      ),
    );
  }
}
