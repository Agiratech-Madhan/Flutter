// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:decorated_dropdownbutton/decorated_dropdownbutton.dart';
import './Chatmodel.dart';
import './Channelmodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _value = 1;
  void _startAddNewtransaction(BuildContext ctex) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: ctex,
      builder: (_) {
        return Container(
          height: 180,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 5),
                  width: 60,
                  height: 3,
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                        top: BorderSide(width: 5, color: Colors.grey)),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 25, left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text('Sort by')),
              ListTile(
                leading: Icon(Icons.list_alt_rounded),
                title: Text("Sections"),
                trailing: Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                      });
                    }),
              ),
              ListTile(
                leading: Icon(Icons.access_time_rounded),
                title: Text("Recent activity"),
                trailing: Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                      });
                    }),
              )
            ],
          ),

          // decoration: BoxDecoration(
          //     border: BorderDirectional(top: BorderSide(width: 3))),

// trailing: Radio(
//                             value: 1,
//                             groupValue: _value,
//                             onChanged: (value) {
//                               setState(() {
//                                 _value = value;
//                               });
//                             })
        );

        // behavior: HitTestBehavior.opaque,

// Border(
//                   top: BorderSide(
//             color: Colors.black,
//             width: 3.0,

//           )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.pink, // <-- SEE HERE
          //   statusBarIconBrightness:
          //       Brightness.dark, //<-- For Android SEE HERE (dark icons)
          //   statusBarBrightness:
          //       Brightness.light, //<-- For iOS SEE HERE (dark icons)
          // ),
          leading: Container(
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset("assets/images/agira.png"),
            ),
          ),
          title: Text(
            "AgiraTech",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () => _startAddNewtransaction(context),
                icon: Icon(Icons.menu_rounded))
          ],
        ),
        body: SingleChildScrollView(
          // reverse: false,

          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Jump to...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(255, 204, 200, 200)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.message_rounded),
                    label: Text(
                      "Threads",
                    ),
                    style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.grey,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10)),
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.send_rounded),
                    label: Text(
                      "Drafts & Sent",
                    ),
                    style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.grey,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10)),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              ExpansionTile(
                onExpansionChanged: (changed) {
                  print('expansion changed $changed');
                },
                childrenPadding: EdgeInsets.all(13.5),
                // children
                title: Text('Channels'),
                children: [
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: channeldata.length,
                      itemBuilder: ((context, i) => TextButton.icon(
                            onPressed: () {},
                            icon: channeldata[i].icon,
                            label: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                channeldata[i].name,
                              ),
                            ),
                            style: TextButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.grey,
                                // alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10)),
                          )))

                  // ,
                  // TextButton.icon(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.monetization_on),
                  //   label: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Drafts & Sent",
                  //     ),
                  //   ),
                  //   style: TextButton.styleFrom(
                  //       elevation: 0,
                  //       backgroundColor: Colors.transparent,
                  //       foregroundColor: Colors.grey,
                  //       // alignment: Alignment.centerLeft,
                  //       padding: EdgeInsets.all(10)),
                  // ),
                  // TextButton.icon(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.send_rounded),
                  //   label: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Drafts & Sent",
                  //     ),
                  //   ),
                  //   style: TextButton.styleFrom(
                  //       elevation: 0,
                  //       backgroundColor: Colors.transparent,
                  //       foregroundColor: Colors.grey,
                  //       // alignment: Alignment.centerLeft,
                  //       padding: EdgeInsets.all(10)),
                  // ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              ExpansionTile(
                title: Text('Direct Messages'),
                children: [
                  Container(
                    // height: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: chatdata.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, i) => Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.asset(chatdata[i].pic),
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: Colors.pink,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          )
                                        ]),
                                  ),
                                  title: Text(chatdata[i].name),

                                  // leading: CircleAvatar(
                                  //   backgroundColor: Colors.grey,
                                  //   backgroundImage:
                                  //       AssetImage(chatdata[i].pic),
                                  // ),
                                )
                              ],
                            )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
