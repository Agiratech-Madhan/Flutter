import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  List images_ = [
    "assets/images/sam.jpg",
    "assets/images/sam.jpg",
    "assets/images/sam.jpg",
    "assets/images/sam.jpg",
    "assets/images/sam.jpg",
  ];
  List text = [
    "Shop menwear",
    "ShopWomenswear",
    "ShopEverything",
    "shop Kidswear",
    "shop accessories"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemBuilder: (BuildContext ctx, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.8),
                        child: ClipRRect(
                          // padding: EdgeInsets.all(20),
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(images_[index]),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            text[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: images_.length,
          ),
          // bottomNavigationBar: BottomNavigationBar(items:BottomNavigationBarItem(icon:Icon(Icons.add),label:  ), ),
          bottomNavigationBar: TextButton(
            child: Text(
              "May be Later",
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {},
          ),
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
