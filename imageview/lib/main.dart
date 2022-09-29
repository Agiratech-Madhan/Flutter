import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  List images_ = ["assets/images/sam.jpg", "assets/images/sam.jpg"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView.builder(
          itemBuilder: (BuildContext ctx, index) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.asset(images_[index]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      // alignment: Alignment.center,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("hello"),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          },
          itemCount: images_.length,
        ),
      ),
    );
  }
}













/***import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  List images_ = ["assets/images/sam.jpg", "assets/images/sam.jpg"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Column(
        children: [
          Container(
            child: Image(
                image: AssetImage(
              "assets/images/sam.jpg",
            )),
          ),
          ListView.builder(itemBuilder: (BuildContext ctx,index){
              return Image.asset(images_[index]);

          },
          itemCount: images_.length,),
        ],
        
      )),
    );
  }
}
 */