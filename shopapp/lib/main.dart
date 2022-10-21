import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:shopapp/screens/products_overview_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color primaryAccentColor = const Color(0xff002A36);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.purple,
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryAccentColor),
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
      ),
      home: ProductOverview(),
      routes: {
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopApp'),
      ),
      body: const Center(
        child: Text('Welcome to shop app'),
      ),
    );
  }
}
