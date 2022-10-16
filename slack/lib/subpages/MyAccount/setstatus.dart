// import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

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
  TextEditingController text_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () => Navigator.pop(context),
          iconSize: 30,
        ),
        title: Text('Set a status'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Save",
                  style: TextStyle(
                      fontSize: 17,
                      color: text_controller.text.isNotEmpty
                          ? Colors.black
                          : Colors.grey)))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 25,
          // ),
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 15),
          // child: IconButton(
          //   icon: Icon(Icons.cancel),
          //   onPressed: () => Navigator.pop(context),
          //   iconSize: 30,
          // ),
          //     ),
          //     SizedBox(
          //       width: 18,
          //     ),
          //     Expanded(
          //         child: Text("Set a status",
          //             style: TextStyle(
          //                 fontSize: 17, fontWeight: FontWeight.bold))),
          // TextButton(
          //     onPressed: () {},
          //     child: Text("Save",
          //         style: TextStyle(
          //             fontSize: 17,
          //             color: text_controller.text.isNotEmpty
          //                 ? Colors.black
          //                 : Colors.grey)))
          //   ],
          // ),
          // Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: text_controller,
              onChanged: (value) {
                setState(() {
                  isEnable = true;
                });

                print('changed$isEnable');
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What's youy status?",
                  prefixIconColor: Colors.transparent,
                  suffixIcon: text_controller.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.cancel_outlined),
                          onPressed: (() => text_controller.text = ''))
                      : Icon(null),
                  prefixIcon: Icon(
                    text_controller.text.isNotEmpty
                        ? Icons.message
                        : Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  )),
            ),
          ),

          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 15),
          //       child: IconButton(
          //         icon: text_controller.text.isNotEmpty
          //             ? Icon(Icons.stacked_line_chart_sharp)
          //             : Icon(Icons.emoji_emotions_outlined),
          //         onPressed: () {},
          //         iconSize: 30,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     Flexible(
          //       child: TextField(
          //         controller: text_controller,
          //         onChanged: (value) {
          //           isEnable = true;
          //         },
          //         decoration: InputDecoration.collapsed(
          //           hintText: "What's your status?",
          //         ),
          //       ),
          //     ),
          //     IconButton(
          //         onPressed: () {},
          //         icon: text_controller.text.isEmpty
          //             ? Icon(Icons.cancel)
          //             : Icon(null))
          //   ],
          // ),
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
          ),
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
