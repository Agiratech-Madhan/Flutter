import 'package:flutter/material.dart';
import './MyAccount.dart';
import './DirectMessages.dart';
import './Mentions.dart';
import './Searchpage.dart';
import 'Home.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedindex = 0;
  void Navigationbartap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  List<Widget> _Pages = [
    Home(),
    DirectMessages(),
    Mentions(),
    SearchPage(),
    MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          body: _Pages[_selectedindex],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.pink,
              currentIndex: _selectedindex,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              onTap: Navigationbartap,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message_outlined), label: 'DMs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.handshake), label: 'Mentions'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.face), label: 'You'),
              ]),
        ),
      ),
    );
  }
}
