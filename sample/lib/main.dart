import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';
import 'package:sample/MEssagegoogle.dart';
import 'package:sample/animations.dart';
import '../Message.dart';
import '../alertdialogue.dart';
import '../authentication.dart';
import '../awaitandasync.dart';
import '../camera.dart';
import '../dropdown.dart';
import '../futures.dart';
import '../groupedlist.dart';
import '../language.dart';
import '../mic.dart';
import '../pageview.dart';
import '../popupmenu.dart';
import '../searchbar.dart';
import '../sliverappbar.dart';
import '../splashorg.dart';
import '../stack.dart';
import '../streams.dart';
import '../Cards.dart';
import './drawer.dart';
import './snackbarmessage.dart';
import './container_example.dart';
import './expansiontile.dart';
import './Radio.dart';
import './emojies.dart';
import './Searchlist.dart';
import '../gridmain.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RoutesExample> types = [
    RoutesExample(
      Names: "moveto drawer",
      widget: Drawer1(),
    ),
    RoutesExample(
      Names: "SnackBarDemo",
      widget: SnackBarDemo(),
    ),
    RoutesExample(
      Names: "ContainerExample",
      widget: ContainerExample(),
    ),
    RoutesExample(
      Names: "Cards",
      widget: Cards(),
    ),
    RoutesExample(
      Names: "Drop",
      widget: Drop(),
    ),
    RoutesExample(
      Names: "MyStatefulWidget",
      widget: MyStatefulWidget(),
    ),
    RoutesExample(
      Names: "Radiosam",
      widget: Radiosam(),
    ),
    RoutesExample(
      Names: "Emojies",
      widget: Emojies(),
    ),
    RoutesExample(
      Names: "Stacks",
      widget: Stacks(),
    ),
    RoutesExample(
      Names: "Sliver",
      widget: Sliver(),
    ),
    RoutesExample(
      Names: "Searchbar",
      widget: Searchbar(),
    ),
    RoutesExample(
      Names: "SearchList",
      widget: SearchList(),
    ),
    RoutesExample(
      Names: "PageViewController",
      widget: PageViewController(),
    ),
    RoutesExample(
      Names: "Popupmenu",
      widget: Popupmenu(),
    ),
    RoutesExample(
      Names: "AlertDialogue",
      widget: AlertDialogue(),
    ),
    RoutesExample(
      Names: "MicExample",
      widget: MicExample(),
    ),
    RoutesExample(
      Names: "CameraExample",
      widget: CameraExample(),
    ),
    RoutesExample(
      Names: "Langauges",
      widget: Langauges(),
    ),
    RoutesExample(
      Names: "Messages",
      widget: Messages(),
    ),
    RoutesExample(
      Names: "Group1",
      widget: Group1(),
    ),
    RoutesExample(
      Names: "AuthScreen",
      widget: AuthScreen(),
    ),
    RoutesExample(
      Names: "FutureExample",
      widget: FutureExample(),
    ),
    RoutesExample(
      Names: "StreamExample",
      widget: StreamExample(),
    ),
    RoutesExample(
      Names: "AsyncAwait",
      widget: AsyncAwait(),
    ),
    RoutesExample(
      Names: "AsyncAwait",
      widget: SplashOrg(),
    ),
    RoutesExample(
      Names: "AnimationExample",
      widget: AnimationExample(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: types.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      // color: Colors.blue.withOpacity(0.7),
                      child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => types[index].widget)),
                          child: Center(
                              child: Text(
                            '${types[index].Names}',
                            style: TextStyle(color: Colors.black),
                          )))),
                )),
      ),
    );

    /**     SafeArea(
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
                    child: Text("AlertDialogue")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraExample()));
                    },
                    child: Text("CameraExample")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Langauges()));
                    },
                    child: Text("Languages")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MicExample()));
                    },
                    child: Text("Mic")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Messages()));
                    },
                    child: Text("Messages")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Group1()));
                    },
                    child: Text("Groupedlistview")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthScreen()));
                    },
                    child: Text("Authetication page")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FutureExample()));
                    },
                    child: Text("Futures")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamExample()));
                    },
                    child: Text("Streams")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AsyncAwait()));
                    },
                    child: Text("await and async")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SplashOrg()));
                    },
                    child: Text("Splash")),
              ],
            ),
          ),
        ),
        // body: Generate(),
      ),
    );
 */
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
    // return GridView.builder(
    //     padding: const EdgeInsets.all(10),
    //     itemCount: 7,
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         childAspectRatio: 3 / 2,
    //         crossAxisSpacing: 10,
    //         mainAxisSpacing: 10),
    //     itemBuilder: (context, index) => Text('data'));
//   }
// }
