import 'package:flutter/material.dart';
import './widgets/animatedBuilderExample.dart';
import './widgets/animated_align.dart';
import './widgets/animations.dart';
import './widgets/Message.dart';
import './widgets/alertdialogue.dart';
import './widgets/authentication.dart';
import './widgets/awaitandasync.dart';
import './widgets/camera.dart';
import './widgets/dropdown.dart';
import './widgets/futures.dart';
import './widgets/groupedlist.dart';
import './widgets/language.dart';
import './widgets/mic.dart';
import './widgets/pageview.dart';
import './widgets/popupmenu.dart';
import './widgets/searchbar.dart';
import './widgets/sliverappbar.dart';
import './widgets/splashorg.dart';
import './widgets/stack.dart';
import './widgets/streams.dart';
import './widgets/Cards.dart';
import './widgets/drawer.dart';
import './snackbarmessage.dart';
import './widgets/container_example.dart';
import './widgets/expansiontile.dart';
import './widgets/Radio.dart';
import './widgets/emojies.dart';
import './widgets/Searchlist.dart';
import './gridmain.dart';

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
    RoutesExample(
      Names: "AnimationAlignExample",
      widget: AnimatedAlignExample(),
    ),
    RoutesExample(
      Names: "AnimatedBuilderExample",
      widget: AnimatedBuilderExample(),
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
  }
}
