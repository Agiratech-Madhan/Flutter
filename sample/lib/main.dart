import 'package:flutter/material.dart';
import 'package:sample/alertdialogue.dart';
import 'package:sample/dates.dart';
import 'package:sample/dropdown.dart';
import 'package:sample/pageview.dart';
import 'package:sample/popupmenu.dart';
import 'package:sample/searchbar.dart';
import 'package:sample/sliverappbar.dart';
import 'package:sample/stack.dart';
import '../Cards.dart';
import './Children2.dart';
import './drawer.dart';
import './snackbarmessage.dart';
import './container_example.dart';
import './expansiontile.dart';
import './Radio.dart';
import './emojies.dart';
import './Searchlist.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Drawer1()));
                    },
                    child: Text("moveto drawer")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SnackBarDemo()));
                    },
                    child: Text("snackbar message")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContainerExample()));
                    },
                    child: Text("container example ")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cards()));
                    },
                    child: Text("Card example ")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Drop()));
                    },
                    child: Text("Expansiontile example ")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyStatefulWidget()));
                    },
                    child: Text("expansion example ")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Radiosam()));
                    },
                    child: Text("Radio example ")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Emojies()));
                    },
                    child: Text("Emojies")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dates()));
                    },
                    child: Text("dates")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Stacks()));
                    },
                    child: Text("Stack")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sliver()));
                    },
                    child: Text("SLiverAppbar")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Searchbar()));
                    },
                    child: Text("SearchBar")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchList()));
                    },
                    child: Text("Searclist")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageViewController()));
                    },
                    child: Text("Pageview")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Popupmenu()));
                    },
                    child: Text("popup")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlertDialogue()));
                    },
                    child: Text("AlertDialogue"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
