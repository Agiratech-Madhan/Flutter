// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slack/subpages/MyAccount/editprofile.dart';
import 'package:slack/subpages/MyAccount/setstatus.dart';
import 'package:google_fonts/google_fonts.dart';

class View_profile_page extends StatelessWidget {
  final String today_date = DateFormat("hh:mm a").format(DateTime.now());
// print(tdata);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      builder: ((context, scrollController) => Container(
            color: Colors.white,
            // height: MediaQuery.of(context).size.height * 0.75,
            child: ListView(
              controller: scrollController,
              children: [
                Stack(
                  children: [
                    Container(
                      // color: Colors.blue,
                      decoration: BoxDecoration(
                          // color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage('assets/images/person1.jpeg'),
                              fit: BoxFit.fill)),
                      // width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          color: Colors.white,
                          iconSize: 25,
                          onPressed: () {},
                          icon: Icon(Icons.message_rounded),
                        ),
                        IconButton(
                          color: Colors.white,
                          iconSize: 25,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile()),
                            );
                          },
                          icon: Icon(Icons.mode_edit_rounded),
                        ),
                        popupitem(context),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      left: 30,
                      child: Row(
                        children: [
                          Text(
                            'Madhan Kumar ',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 70,
                  // padding: EdgeInsets.all(0.7),
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black),
                              onPressed: () {},
                              child: Text('Edit Profile'))),
                      SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // shadowColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      side: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black),
                              onPressed: () {},
                              child: Text('Message'))),
                      Container(
                        // padding: EdgeInsets.only(left),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black.withOpacity(0.5), width: 1),
                          // color: Colors.red,
                        ),
                        // color: Colors.red,
                        child: popupitem(context),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Display name',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('Madhan')
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetStatus()),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('Set a status')
                    ],
                  ),
                ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Local time',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(today_date)
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('madhan.k@agiratech.com')
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  PopupMenuButton<int> popupitem(BuildContext context) {
    return PopupMenuButton(
        onSelected: (value) {
          if (value == 1) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => EditProfile()),
            // );
          }
        },
        icon: Icon(
          Icons.more_vert_outlined,
          color: Colors.black,
        ),
        iconSize: 25,
        // color: Colors.white,
        itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text(
                  "Viewfiles",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text(
                  "ShareContact",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ]);
  }
}
