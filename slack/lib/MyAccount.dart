import 'package:flutter/material.dart';
import 'package:slack/widgets/setstatus.dart';
import './Chatmodel.dart';
import './widgets/pause.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Stack(alignment: Alignment.bottomRight, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset("assets/images/person.png"),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                )
              ]),
            ),
            title: Text("Madhan"),
            subtitle: Text("Active"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.grey,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.grey))),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SetStatus()),
                    ),
                icon: const Icon(Icons.sentiment_satisfied_alt_outlined),
                label: const Padding(
                  padding: EdgeInsets.only(right: 130, top: 15, bottom: 15),
                  child: Text(
                    "Update your status",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15),
                  ),
                )),
          ),
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
                label: const Text(
                  "Pause notifications",
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
                onPressed: () {},
                icon: const Icon(Icons.person_search_sharp),
                label: const Text(
                  "Pause notifications",
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
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
                label: const Text(
                  "Saved Items",
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
                onPressed: () {},
                icon: const Icon(Icons.person_search_sharp),
                label: const Text(
                  "View profile",
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
                onPressed: () {},
                icon: const Icon(Icons.mobile_screen_share_sharp),
                label: const Text(
                  "Notifications",
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
                onPressed: () {},
                icon: const Icon(Icons.sentiment_satisfied_alt_outlined),
                label: const Text(
                  "Preferences",
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
        ],
      ),
    );
  }
}
/**
 * 
 * 
 * 
 * 
 ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.notifications_off_sharp),
                label: const Text(
                  "Pause notifications",
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
                top: 20,
              ),
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_search_sharp),
                label: Row(
                  children: [
                    const Text(
                      "Set yourself as ",
                    ),
                    Text(
                      "away",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
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
          










 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  ListTile(
            leading: Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.notifications_off_sharp),
                label: const Text(
                  "Pause notifications",
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
          ), */