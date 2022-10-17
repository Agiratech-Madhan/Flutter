import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slack/models/mentionsmodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:slack/models/messageModel.dart';

class ChatScreen extends StatefulWidget {
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
  void submitted(String value) {
    final message =
        Message(text: value, date: DateTime.now(), isSentByMe: true);
    setState(() {
      messages.add(message);
      text_controller.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    bool fab = MediaQuery.of(context).viewInsets.bottom != 0.0;
    FocusScopeNode currentFocus = FocusScope.of(context);

    var topborder = Row(
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.mic))],
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, String>(
            useStickyGroupSeparators: true,
            floatingHeader: true,
            reverse: true,
            order: GroupedListOrder.DESC,
            elements: messages,
            groupBy: (message) => DateTime(
                    message.date.year, message.date.month, message.date.day)
                .toString(),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(DateFormat.yMMMd().format(message.date)),
                  ),
                ),
              ),
            ),
            itemBuilder: ((context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                    elevation: 7,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(message.text),
                    ),
                  ),
                )),
          )),
          Card(
            elevation: 6,
            child: Column(
              children: [
                if (fab) topborder,
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
                    onSubmitted: (text) {
                      submitted(text);
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
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: text_controller.text.isEmpty
                                    ? Colors.white
                                    : Colors.green.shade900,
                                child: IconButton(
                                  onPressed: () =>
                                      submitted(text_controller.text),
                                  icon: Icon(
                                    Icons.send,
                                    size: 23,
                                  ),
                                  color: text_controller.text.isEmpty
                                      ? Colors.black38
                                      : Colors.white,
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
