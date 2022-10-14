// import 'package:flutter/material.dart';

// class AlertDialogue extends StatefulWidget {
//   const AlertDialogue({super.key});

//   @override
//   State<AlertDialogue> createState() => _AlertDialogueState();
// }

// class _AlertDialogueState extends State<AlertDialogue> {
//   int _crtIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     return
// // AlertDialog(
// //       title: Text("Methods"),
// //       content: ListView(children: <Widget>[
// //         RadioListTile(
// //             value: 1,
// //             groupValue: _crtIndex,
// //             title: Text("A"),
// //             activeColor: Colors.teal,
// //             onChanged: (val) {
// //               setState(() {
// //                 _crtIndex = val;
// //               });
// //             }),
// //         RadioListTile(
// //             value: 2,
// //             groupValue: _crtIndex,
// //             title: Text("B"),
// //             activeColor: Colors.teal,
// //             onChanged: (val) {
// //               setState(() {
// //                 _crtIndex = val;
// //               });
// //             }),
// //         RadioListTile(
// //             value: 3,
// //             groupValue: _crtIndex,
// //             title: Text("C"),
// //             activeColor: Colors.teal,
// //             onChanged: (val) {
// //               setState(() {
// //                 _crtIndex = val;
// //               });
// //             }),
// //         RadioListTile(
// //             value: 4,
// //             groupValue: _crtIndex,
// //             title: Text("D"),
// //             activeColor: Colors.teal,
// //             onChanged: (val) {
// //               setState(() {
// //                 _crtIndex = val;
// //               });
// //             }),
// // // actions: <Widget>[
// // //         new FlatButton(
// // //           child: new Text('OK'),
// // //           onPressed: () {
// // // // pass data
// // //             Navigator.of(context).pop();
// //         // },
// //       ]),
// //     );
//   }
// }

import 'package:flutter/material.dart';

class AlertDialogue extends StatelessWidget {
  const AlertDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksForGeeks"),
        backgroundColor: Colors.green,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Alert Dialog Box"),
                  content: const Text("You have raised a Alert Dialog Box"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Show alert Dialog box"),
          ),

// RaidedButton is deprecated and should not be used
// Instead use ElevatedButton

          // child: RaisedButton(
          // onPressed: () {
          //	 showDialog(
          //	 context: context,
          //	 builder: (ctx) => AlertDialog(
          //		 title: const Text("Alert Dialog Box"),
          //		 content: const Text("You have raised a Alert Dialog Box"),
          //		 actions: <Widget>[

          // FlatButton is deprecated and should not be used
          // Instead use TextButton

          //		 FlatButton(
          //			 onPressed: () {
          //			 Navigator.of(ctx).pop();
          //			 },
          //			 child: const Text("okay"),
          //		 ),
          //		 ],
          //	 ),
          //	 );
          // },
          // child: const Text("Show alert Dialog box"),
          // ),
        ),
      ),
    );
  }
}
