import 'package:flutter/material.dart';
import 'package:movieapp/pages/home_page.dart';
import 'package:movieapp/provider/movie_list_provider.dart';
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
      create: (context) => MovieListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        // initialRoute: ,
        onGenerateRoute: route.controller,
      ),
    );
  }
}
