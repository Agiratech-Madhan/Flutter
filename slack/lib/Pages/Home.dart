import 'package:flutter/material.dart';
import 'package:slack/subpages/DMs/Jumpto.dart';
import 'package:slack/subpages/Home/BottomSheet.dart';
import 'package:slack/subpages/Home/Chatscreen.dart';
import 'package:slack/subpages/Home/Drafts.dart';
import 'package:slack/subpages/Home/Invite.dart';
import 'package:slack/subpages/Home/Threads.dart';
import 'package:slack/subpages/Home/drawer.dart';
// import 'package:flutter/services.dart';
// import 'package:decorated_dropdownbutton/decorated_dropdownbutton.dart';
import '../models/Chatmodel.dart';
import '../models/Channelmodel.dart';
// import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    bool FAB = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      drawer: Drawer(
        child: MainDrawer(ctx: context),
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
        title: Text(
          "AgiraTech",
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
        actions: [SubBottomSheet()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  child: Padding(
                    padding: EdgeInsets.only(right: 220, top: 12, bottom: 12),
                    child: Text(
                      "Jump to....",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.notoSans(fontSize: 15),
                    ),
                  )),
            ),
            ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton.icon(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Threads())),
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Draft())),
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
                          onPressed: () {
                            print('object');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          c_icon: channeldata[i].icon,
                                          c_name: channeldata[i].name,
                                        )));
                          },
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
                                // onTap: () {
                                //   print('object');
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => ChatScreen()));
                                // },
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
