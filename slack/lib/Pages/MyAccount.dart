import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slack/subpages/Home/Preferences.dart';
import 'package:slack/subpages/MyAccount/Notifications.dart';
import 'package:slack/subpages/MyAccount/saved_items.dart';
import 'package:slack/subpages/MyAccount/setstatus.dart';
import 'package:slack/subpages/MyAccount/editprofile.dart';
import 'package:slack/subpages/MyAccount/viewprofile.dart';
import '../models/Chatmodel.dart';
import '../subpages/MyAccount/pause.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool issetted = true;

  void view_profile(BuildContext ctex) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        context: ctex,
        builder: (context) {
          return View_profile_page();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff002A36),
        title: const Text("You"),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfile())),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Stack(alignment: Alignment.bottomRight, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset("assets/images/person.png"),
                ),
                Container(
                    child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: issetted ? Colors.pink : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                ))
              ]),
            ),
            title: Text("Madhan"),
            subtitle: Text(issetted ? 'Active' : 'away'),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetStatus()),
                ),
                icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                label: Text(
                  "Update your status",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.notoSans(fontSize: 15),
                ),
              )),
          ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton.icon(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Pause())),
                icon: const Icon(Icons.notifications_off_sharp),
                label:
                    Text("Pause notifications", style: GoogleFonts.notoSans()),
                style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 1, top: 10, bottom: 10)),
              ),
            ),
          ),
          ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: GestureDetector(
                // onTap: () => checkstatus(issetted)
                // setState(() {
                //   isset();
                // })
                // ,
                child: TextButton.icon(
                  onPressed: () => setState(() {
                    issetted = !issetted;
                    print('setstate called');
                    print(issetted);
                  }),
                  icon: const Icon(Icons.person_search_sharp),
                  label: Row(
                    children: [
                      Text("Set yourself as", style: GoogleFonts.notoSans()),
                      Text(issetted ? ' active' : ' away')
                    ],
                  ),
                  style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      alignment: Alignment.centerLeft,
                      padding:
                          const EdgeInsets.only(left: 1, top: 10, bottom: 10)),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton.icon(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SavedItems())),
                icon: const Icon(Icons.bookmark_border),
                label: Text(
                  "Saved Items",
                  style: GoogleFonts.notoSans(),
                ),
                style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 1, top: 10, bottom: 10)),
              ),
            ),
          ),
          ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton.icon(
                onPressed: () => view_profile(context),
                icon: const Icon(Icons.person_search_sharp),
                label: Text("View profile", style: GoogleFonts.notoSans()),
                style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 1, top: 10, bottom: 10)),
              ),
            ),
          ),
          ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton.icon(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications())),
                icon: const Icon(Icons.mobile_screen_share_sharp),
                label: Text("Notifications", style: GoogleFonts.notoSans()),
                style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 1, top: 10, bottom: 10)),
              ),
            ),
          ),
          ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton.icon(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Preferences())),
                icon: Icon(FontAwesomeIcons.facebookMessenger),
                label: Text("Preferences", style: GoogleFonts.notoSans()),
                style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 1, top: 10, bottom: 10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
