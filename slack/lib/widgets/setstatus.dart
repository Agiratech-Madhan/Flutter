import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slack/models/statusmodel.dart';

class SetStatus extends StatefulWidget {
  const SetStatus({super.key});

  @override
  State<SetStatus> createState() => _SetStatusState();
}

class _SetStatusState extends State<SetStatus> {
  bool isEnable = false;
  bool isselected = false;
  bool typed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   margin: EdgeInsets.only(top: 30),
          //   // padding: EdgeInsets.all(10),
          //   child: ListTile(
          //     dense: true,
          //     // visualDensity: VisualDensity(horizontal: -, vertical: 0),
          //     leading: IconButton(
          //       icon: Icon(Icons.cancel_outlined),
          //       iconSize: 30,
          //       onPressed: null,
          //     ),
          //     title: Padding(
          //       padding: const EdgeInsets.only(left: 0),
          //       child: Text("Set a status",
          //           style:
          //               TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          //     ),
          //     trailing: TextButton(
          //       child: Text("Save",
          //           style: TextStyle(
          //               fontSize: 16,
          //               color: isEnable ? Colors.black : Colors.grey)),
          //       onPressed: () {},
          //     ),
          //   ),
          // ),
          // Divider(
          //   color: Colors.grey,
          // ),
          // Spacer(),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () => Navigator.pop(context),
                  iconSize: 30,
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Expanded(
                  child: Text("Set a status",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold))),
              TextButton(
                  onPressed: () {},
                  child: Text("Save",
                      style: TextStyle(
                          fontSize: 17,
                          color: isEnable ? Colors.black : Colors.grey)))
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  icon: isselected
                      ? Icon(Icons.stacked_line_chart_sharp)
                      : Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {},
                  iconSize: 30,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What's your status?",
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: typed ? Icon(Icons.cancel) : Icon(null))
            ],
          ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: ElevatedButton(
          //           onPressed: () {},
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [Text("Madhan"), Text("Dont clear")],
          //           )),
          //     ),
          //   ],
          // )

          Column(
            children: [
              false
                  ? Divider(
                      color: Colors.grey,
                    )
                  : Container(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    child: ListTile(
                      // minLeadingWidth: 49,
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Madhan...",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text("Dont clear...",
                                style: TextStyle(fontSize: 17))
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          )
          // Text("hello")
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     IconButton(
          //       icon: Icon(Icons.cancel),
          //       onPressed: null,
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     Text("Set a status"),
          //     TextButton(
          //       child: Text("Save"),
          //       onPressed: () {},
          //     ),
          //   ],
          // )
          ,
          const Padding(
            padding: EdgeInsets.only(right: 220, top: 20, bottom: 10),
            child: Text(
              "For AgiraTech",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: setstatus.length,
                itemBuilder: ((context, i) => ListTile(
                      leading: Text(setstatus[i].icon),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(setstatus[i].text),
                          Text(setstatus[i].time)
                        ],
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
