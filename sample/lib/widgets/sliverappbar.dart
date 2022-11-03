import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Sliver extends StatefulWidget {
  const Sliver({super.key});

  @override
  State<Sliver> createState() => _SliverState();
}

class _SliverState extends State<Sliver> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 8,
          itemBuilder: ((context, index) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15,
                        left: MediaQuery.of(context).size.width * 0.227,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vignesh mentioned everyone in",
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('#agira_team')
                            ],
                          ),
                        ),
                        Text(
                          "1hr",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/person1.jpeg')),
                    ),
                    title: Text(
                      "Madhan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "A belated birthday wishes that your life may be filled with joy, peace and the love that you dese ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.227,
                        top: 10,
                        right: MediaQuery.of(context).size.width * 0.10),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 30,
                                // color: Colors.lightBlue[100],
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.blue),
                                  color: Colors.lightBlue[100],
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(15),
                                      right: Radius.circular(15)),
                                ),
                                // decoration: BoxDecoration(
                                //     border:
                                //         Border.all(width: 1, color: Colors.blue)),
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('\u{1f912}'), Text('1')],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(15),
                                  right: Radius.circular(15)),
                              child: Container(
                                width: 40,
                                height: 30,
                                color: Colors.grey[200],
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Builder(builder: (context) {
                              return Positioned.fill(
                                child: FittedBox(
                                  child: IconButton(
                                      iconSize: 30.0,
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.emoji_emotions_outlined)),
                                ),
                              );
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}



/**ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15,
                        left: MediaQuery.of(context).size.width * 0.227,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vignesh mentioned everyone in",
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('#agira_team')
                            ],
                          ),
                        ),
                        Text(
                          "1hr",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/person1.jpeg')),
                    ),
                    title: Text(
                      "Madhan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "A belated birthday wishes that your life may be filled with joy, peace and the love that you dese ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.227,
                        top: 10,
                        right: MediaQuery.of(context).size.width * 0.10),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 30,
                                // color: Colors.lightBlue[100],
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.blue),
                                  color: Colors.lightBlue[100],
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(15),
                                      right: Radius.circular(15)),
                                ),
                                // decoration: BoxDecoration(
                                //     border:
                                //         Border.all(width: 1, color: Colors.blue)),
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('\u{1f912}'), Text('1')],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(15),
                                  right: Radius.circular(15)),
                              child: Container(
                                width: 40,
                                height: 30,
                                color: Colors.grey[200],
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Builder(builder: (context) {
                              return Positioned.fill(
                                child: FittedBox(
                                  child: IconButton(
                                      iconSize: 30.0,
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.emoji_emotions_outlined)),
                                ),
                              );
                            })
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              // ListTile(
              //   leading: SizedBox(
              //       width: 50,
              //       height: 50,
              //       child: Image.asset('assets/images/person1.jpeg')),
              //   title: Column(
              //     children: [
              //       Text("datafdjfbsdufbbfdbfusdfbsufbsudfsudfbdufbsdufb"),
              //       Text("datafdjfbsdufbbfdbfusdfbsufbsudfsudfbdufbsdufb"),
              //       Text("datafdjfbsdufbbfdbfusdfbsufbsudfsudfbdufbsdufb"),
              //       Text("datafdjfbsdufbbfdbfusdfbsufbsudfsudfbdufbsdufb"),
              //       Text("datafdjfbsdufbbfdbfusdfbsufbsudfsudfbdufbsdufb"),
              //       Text("datafdjfbsdufbbfdbfusdfbsufbsudfsudfbdufbsdufb"),
              //       Text("data"),
              //     ],
              //   ),
              // ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ) */