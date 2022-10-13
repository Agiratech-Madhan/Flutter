import 'package:flutter/material.dart';
import 'package:slack/subpages/DMs/Jumpto.dart';
// import 'package:flutter/services.dart';
// import 'package:decorated_dropdownbutton/decorated_dropdownbutton.dart';
import '../models/Chatmodel.dart';
import '../models/Channelmodel.dart';
// import 'package:flat_icons_flutter/flat_icons_flutter.dart';

enum Services {
  sections,
  recent,
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Services? _services;
  var result = 1;
  void check(value) {
    setState(() {
      result = value;
    });
  }

  void Bottomsheet(BuildContext ctex) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
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
                  decoration: const BoxDecoration(
                    border: BorderDirectional(
                        top: BorderSide(width: 5, color: Colors.grey)),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 25, left: 15),
                  alignment: Alignment.centerLeft,
                  child: const Text('Sort by')),
              ListTile(
                leading: const Icon(Icons.list_alt_rounded),
                title: const Text("Sections"),
                trailing: Radio<dynamic>(
                  value: 1,
                  groupValue: result,
                  onChanged: (x) => check(x),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: const Icon(Icons.access_time_rounded),
                title: const Text("Recent activity"),
                trailing: Radio<dynamic>(
                    value: 2, groupValue: result, onChanged: (x) => check(x)),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool FAB = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 100,
                  child: DrawerHeader(
                      // margin: EdgeInsets.all(0.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Workspaces",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ))),
                ),
                ListTile(
                  leading: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                          // color: Colors.transparent,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("assets/images/agira.png")),
                      Positioned(
                        top: -5,
                        right: -5,
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                              width: 25,
                              height: 20,
                              // color: Colors.pink,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10),
                                      right: Radius.circular(10)))),
                          Row(
                            children: [
                              Text(
                                "4",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text("+", style: TextStyle(color: Colors.white))
                            ],
                          )
                        ]),
                      )
                    ],
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "AgiraTech",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "agiratech.slack.com",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ],
                  ),
                  trailing: Icon(Icons.more_vert),
                )
              ],
            ),
            Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: SizedBox(
                            // width: MediaQuery.of(context).size.width * 0.9,
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle_outline),
                              label: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Add a workspace",
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(10)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: SizedBox(
                            // width: MediaQuery.of(context).size.width * 0.9,
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.settings),
                              label: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Preferences",
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(10)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: SizedBox(
                            // width: MediaQuery.of(context).size.width * 0.9,
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.help_outline_outlined),
                              label: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Help",
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(10)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      //#013A20 013A20
      appBar: AppBar(
        backgroundColor: Color(0xff002A36),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Container(
              // margin: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset("assets/images/agira.png"),
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        //  Container(
        //   margin: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(5),
        //     child: Image.asset("assets/images/agira.png"),
        //   ),
        // ),
        title: const Text(
          "AgiraTech",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Bottomsheet(context);
              },
              icon: const Icon(Icons.filter_list))
        ],
      ),
      body: SingleChildScrollView(
        // reverse: false,

        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            // Container(
            //   margin: const EdgeInsets.all(15),
            //   height: 40,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       labelText: 'Jump to...',
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //             width: 1, color: Color.fromARGB(255, 204, 200, 200)),
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.grey,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.grey))),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Jumpto()),
                      ),
                  // icon: const Icon(Icons.sentiment_satisfied_alt_outlined),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 220, top: 12, bottom: 12),
                    child: Text(
                      "Jump to....",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15),
                    ),
                  )),
            ),
            ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message_rounded),
                  label: const Text(
                    "Threads",
                  ),
                  style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.grey,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10)),
                ),
              ),
            ),
            ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send_rounded),
                  label: const Text(
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
                                leading: SizedBox(
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
                                        Positioned(
                                          bottom: -2,
                                          right: -2,
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.pink,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                                title: Text(chatdata[i].name),
                              )
                            ],
                          )),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10,
        child: Icon(Icons.edit),
        backgroundColor: Color(0xff002A36),
      ),
    );
  }
}
