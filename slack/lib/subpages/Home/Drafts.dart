import 'package:flutter/material.dart';
import 'package:slack/models/Chatmodel.dart';

void main() {
  runApp(Draft());
}

class Draft extends StatefulWidget {
  const Draft({super.key});

  @override
  State<Draft> createState() => _DraftState();
}

class _DraftState extends State<Draft> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios)),
            title: Text('Drafts & Sent'),
            bottom: TabBar(
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 4),
              ),
              labelColor: Colors.black,
              tabs: [
                // Tab(),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Draft ',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '2',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                const Tab(
                  child: Text(
                    'Sheduled',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const Tab(
                  child: Text(
                    'Sent',
                    style: TextStyle(fontSize: 17),
                  ),
                )

                // Tab(icon: Icon(Icons.directions_car)),
                // Tab(icon: Icon(Icons.directions_transit)),
                // Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              drafts(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.grey,
                    size: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Write now,send later',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10,
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: const Text(
                      "Scheduled message to be sent at a later time, or another day together,They'll wait here untill they're delevered",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          // textStyle: FontWeight.bold,
                          foregroundColor: Colors.black),
                      onPressed: () {},
                      child: const Text(
                        'New Message',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              drafts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget drafts() {
    return ListView.builder(
      //  item
      shrinkWrap: true,
      itemCount: 6,
      // physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) => Column(
        children: [
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Stack(alignment: Alignment.bottomRight, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(chatdata[i].pic),
                ),
                if (true)
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 3, color: Colors.white),
                      ),
                    ),
                  )
              ]),
            ),
            title: Text(chatdata[i].name),
            subtitle: Text(
              chatdata[i].msg,
              style: const TextStyle(fontSize: 15),
            ),
            trailing: Text(chatdata[i].time),
          )
        ],
      ),
    );
  }
}
