import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slack/models/mentionsmodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  // const ChatScreen({super.key});
  final Widget c_icon;
  final String c_name;
  final bool DM;

  ChatScreen({required this.c_icon, required this.c_name, required this.DM});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController text_controller = TextEditingController();
  bool isEnable = false;

  @override
  Widget build(BuildContext context) {
    bool fab = MediaQuery.of(context).viewInsets.bottom != 0.0;
    FocusScopeNode currentFocus = FocusScope.of(context);

    var top_border = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(2), right: Radius.circular(2))),
            width: 50,
            height: 3,
          ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
        titleTextStyle: GoogleFonts.notoSans(color: Colors.black87),
        title: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: widget.c_icon),
                Text(
                  widget.c_name,
                  style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(child: ListView()),
          ),
          Card(
            elevation: 6,
            child: Column(
              children: [
                if (fab) top_border,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 60,
                  child: TextField(
                    // focusNode: currentFocus,
                    controller: text_controller,
                    onChanged: (value) {
                      setState(() {
                        isEnable = true;
                      });
                    },
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: !fab
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(!fab ? Icons.add : null),
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                )
                              : null,
                        ),
                        prefixIconColor: Colors.grey,
                        suffixIcon: !fab ? Icon(Icons.mic) : null,
                        //  Icon(!fab ? Icons.mic_none_rounded : null),
                        hintText: 'Message #task-review'),
                  ),
                ),
                fab
                    ? Container(
                        padding: EdgeInsets.only(left: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.2),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      // size: 27,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.sentiment_satisfied_alt_outlined,
                                    size: 27,
                                  ),
                                  color: Colors.black54,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.alternate_email,
                                    size: 27,
                                  ),
                                  color: Colors.black54,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.text_fields_outlined,
                                    size: 27,
                                  ),
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: text_controller.text.isEmpty
                                      ? Colors.white
                                      : Colors.green.shade900,
                                  child: Icon(
                                    Icons.send,
                                    size: 23,
                                    color: text_controller.text.isEmpty
                                        ? Colors.black38
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
