import 'package:flutter/material.dart';

class ChatKeyBoard extends StatefulWidget {
  //  BuildContext context
  // ChatKeyBoard({required this.top_border});

  @override
  State<ChatKeyBoard> createState() => _ChatKeyBoardState();
}

class _ChatKeyBoardState extends State<ChatKeyBoard> {
  TextEditingController text_controller = TextEditingController();
  bool isEnable = false;
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
  final focusnode = FocusNode();
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    bool focused = currentFocus.isFirstFocus;
    return Card(
      elevation: 6,
      child: Column(
        children: [
          if (focused) top_border,
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: 60,
            child: TextField(
              focusNode: focusnode,
              controller: text_controller,
              onChanged: (value) {
                setState(() {
                  isEnable = true;
                  print('focused or not${currentFocus.hasFocus}');
                  print('focused or not${focusnode}');
                });
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: !focused
                        ? CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(!focused ? Icons.add : null),

                              // size: 27,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          )
                        : Icon(null),
                  ),
                  prefixIconColor: Colors.grey,
                  suffixIcon: Icon(!focused ? Icons.mic_none_rounded : null),
                  hintText: 'Message #task-review'),
            ),
          ),
          focusnode.hasFocus
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
                              backgroundColor: Colors.grey.withOpacity(0.2),
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
                              Icons.text_fields,
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
    );
  }
}
