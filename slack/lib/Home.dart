import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
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
            IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded))
          ],
        ),
        body: Column(
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
                width: MediaQuery.of(context).size.width,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.message_rounded),
                  label: Text(
                    "Threads",
                  ),
                  style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color.fromARGB(232, 255, 255, 255),
                      foregroundColor: Colors.grey,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10)),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.message_rounded),
                  label: Text(
                    "Threads",
                  ),
                  style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color.fromARGB(232, 255, 255, 255),
                      foregroundColor: Colors.grey,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10)),
                ),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
