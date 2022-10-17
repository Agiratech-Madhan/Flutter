import 'package:flutter/material.dart';
import 'package:slack/subpages/Home/Preferences.dart';
import 'package:slack/subpages/Home/Workspaces.dart';
import './Invite.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatefulWidget {
  // const MainDrawer({super.key});

  final BuildContext ctx;
  MainDrawer({required this.ctx});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  void Bottomsheet1(BuildContext ctx) {
    print('contstroris called');
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: ctx,
      builder: (_) {
        return SizedBox(
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                // contentPadding: EdgeInsets.only(left: 5),
                visualDensity: VisualDensity(horizontal: -2.0),
                leading: Container(
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey)),
                  height: 30,
                  // color: Colors.blue,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 3.0, right: 3, bottom: 3),
                    child: Image.asset('assets/images/agira.png'),
                  ),
                ),
                title: Text(
                  '  AgiraTech',
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 19),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Invite()));
                },
                dense: true,
                // visualDensity: VisualDensity(horizontal: -2.0),
                leading: Icon(Icons.person_add_alt),
                title: Text(
                  'Invite memebers',
                  style: GoogleFonts.notoSans(fontSize: 15),
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: -3.0),
                leading: Icon(
                  Icons.output_rounded,
                  color: Colors.red[600],
                ),
                title: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign out',
                        style: GoogleFonts.notoSans(
                            fontSize: 15, color: Colors.red[600]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                  // margin: EdgeInsets.all(0.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Workspaces",
                        style: GoogleFonts.notoSans(
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
                            style: GoogleFonts.notoSans(color: Colors.white),
                          ),
                          Text("+",
                              style: GoogleFonts.notoSans(color: Colors.white))
                        ],
                      )
                    ]),
                  )
                ],
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AgiraTech",
                    style: GoogleFonts.notoSans(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "agiratech.slack.com",
                    style:
                        GoogleFonts.notoSans(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
              trailing: IconButton(
                  onPressed: (() => Bottomsheet1(context)),
                  icon: Icon(Icons.more_vert)),
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
                        width: 270,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Workspaces())));
                          },
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
                        width: 270,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Preferences())));
                          },
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
                        width: 270,
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
    );
  }
}
