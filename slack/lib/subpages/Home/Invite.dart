import 'package:flutter/material.dart';
// import 'package:slack/pages/Home.dart';
import 'package:google_fonts/google_fonts.dart';

class Invite extends StatefulWidget {
  // final BuildContext contex;

  // Invite({required this.contex});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  // BuildContext? ctx1=contex;

  bool isEnable = false;
  TextEditingController pmailController = TextEditingController();
  TextEditingController amailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () => {Navigator.pop(context)}),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invite',
              style: GoogleFonts.notoSans(fontWeight: FontWeight.normal),
            ),
            Text(
              'Agiratech',
              style: GoogleFonts.notoSans(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            )
          ],
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: (pmailController.text.isEmpty &&
                          amailController.text.isEmpty)
                      ? Colors.grey
                      : Colors.black),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Save Request',
                style: GoogleFonts.notoSans(fontWeight: FontWeight.normal),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Fill in Who you'd like to invite.Your request will be sent to your admin for approval",
              style: GoogleFonts.notoSans(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            child: Column(
              children: [
                TextField(
                  controller: pmailController,
                  onChanged: (value) {
                    setState(() {
                      isEnable = true;
                    });

                    print('changed$isEnable');
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add  an email address',
                      prefixIconColor: Colors.transparent,
                      suffixIcon: pmailController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.cancel_outlined),
                              onPressed: (() => pmailController.text = ''))
                          : Icon(null),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Icon(
                          Icons.mail_outlined,
                          color: Colors.grey,
                        ),
                      )),
                ),
                if (isEnable)
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 16),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                if (isEnable)
                  TextField(
                    controller: amailController,
                    decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(),

                        border: InputBorder.none,
                        hintText: 'Add  another  email address',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Icon(
                            Icons.mail_outlined,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                if (pmailController.text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 16),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                if (pmailController.text.isNotEmpty)
                  TextButton(onPressed: () {}, child: Text('Allow suggestions'))
              ],
            ),
          ),
          Card(
              child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.97,
            child: TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {},
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.red,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Row(
                    children: [
                      Text(
                        'Contacts',
                        textAlign: TextAlign.left,
                        style:
                            GoogleFonts.notoSans(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Slack is better with others.  ',
                style:
                    GoogleFonts.notoSans(color: Colors.black.withOpacity(0.7)),
              ),
              Transform.rotate(
                  angle: -5.5,
                  child: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.black.withOpacity(0.7),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
