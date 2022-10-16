import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/Chatmodel.dart';

class Chat2 extends StatefulWidget {
  const Chat2({super.key});

  @override
  State<Chat2> createState() => _Chat2State();
}

class _Chat2State extends State<Chat2> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(chatdata[i].pic),
                  ),
                )
              ],
            ));
  }
}
