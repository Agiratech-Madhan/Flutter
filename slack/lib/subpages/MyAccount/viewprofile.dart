import 'dart:ui';

import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  TextEditingController text_controller = TextEditingController();
  void controller(String value) {
    text_controller.text = 'madhan';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  ,
      // ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: SizedBox(
              height: 50,
              child: ListTile(
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 26,
                    ),
                  ),
                  title: Text(
                    "EditProfile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: TextButton(
                      onPressed: () {},
                      child: Text('Save', style: TextStyle(fontSize: 15)))),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 10),
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/images/person1.jpeg')),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Icon(
                      Icons.camera_alt,
                      color: true ? Colors.white : Color(0xff002A36),
                    ),
                  ),
                ]),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Full Name'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    controller: text_controller,
                    decoration: InputDecoration(hintText: 'Madhan'),
                  ),
                )
              ]),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Display Name',
                  style: TextStyle(color: Colors.grey),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Madhan',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 20, bottom: 15),
                  child: Text(
                      'This is the name that shows when someone uses  @to mentione you',
                      style: TextStyle(color: Colors.grey)),
                ),
                Text('Contact'),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Madhan',
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
