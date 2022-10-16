// import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController text_controller = TextEditingController();
  TextEditingController text_display_controller = TextEditingController();

  void controller(String value) {
    text_controller.text = 'Madhan Kumar';
    text_display_controller.text = 'Madhan';
  }

  void initState() {
    super.initState();
    // _controller = new TextEditingController(text: 'Initial value');
    text_controller.text = 'Madhan Kumar';
    text_display_controller.text = 'Madhan';
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
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          //  side: BorderSide(
                          //    color: Colors.deepPurpleAccent, //<-- SEE HERE
                          //  ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Save',
                          style: GoogleFonts.notoSans(fontSize: 15)))),
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
                    decoration: InputDecoration(hintText: ''),
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
                  style: GoogleFonts.notoSans(color: Colors.grey),
                ),
                TextField(
                  controller: text_display_controller,
                  decoration: InputDecoration(
                    hintText: '',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 20, bottom: 15),
                  child: Text(
                      'This is the name that shows when someone uses  @to mentione you',
                      style: GoogleFonts.notoSans(color: Colors.grey)),
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
