import 'package:flutter/material.dart';
import 'package:slack/subpages/Home/Chatscreen.dart';
import '../models/Chatmodel.dart';
// import '../models/Chatmodel.dart';
import '../subpages/DMs/Jumpto.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectMessages extends StatefulWidget {
  const DirectMessages({super.key});

  @override
  State<DirectMessages> createState() => _DirectMessagesState();
}

class _DirectMessagesState extends State<DirectMessages> {
  @override
  Widget build(BuildContext context) {
    bool fab = MediaQuery.of(context).viewInsets.bottom != 0.0;
    // print(fab);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Direct messages'),
            // backgroundColor: Colors.pink,
            backgroundColor: const Color(0xff002A36),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.grey,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey))),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Jumpto()),
                        ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 220, top: 12, bottom: 12),
                      child: Text(
                        "Jump to....",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.notoSans(fontSize: 15),
                      ),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: chatdata.length,
                  itemBuilder: (context, i) {
                    var sizedBox = SizedBox(
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
                                border:
                                    Border.all(width: 3, color: Colors.white),
                              ),
                            ),
                          )
                      ]),
                    );
                    return Column(
                      children: [
                        ListTile(
                          leading: sizedBox,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(chatdata[i].name),
                          ),
                          subtitle: Text(
                            chatdata[i].msg,
                            style: GoogleFonts.notoSans(fontSize: 15),
                          ),
                          trailing: Text(chatdata[i].time),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: Visibility(
            visible: !fab,
            child: FloatingActionButton(
              onPressed: () {},
              elevation: 10,
              child: Icon(Icons.edit),
              backgroundColor: Color(0xff002A36),
            ),
          ),
        ),
      ),
    );
  }
}
///nestedscrollview