import 'package:flutter/material.dart';
// import 'package:slack/pages/Home.dart';

class Invite extends StatefulWidget {
  // final BuildContext contex;

  // Invite({required this.contex});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  // BuildContext? ctx1=contex;

  bool isEnable = false;
  TextEditingController p_mail_controller = TextEditingController();
  TextEditingController a_mail_controller = TextEditingController();

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
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            Text(
              'Agiratech',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            )
          ],
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: (p_mail_controller.text.isEmpty &&
                          a_mail_controller.text.isEmpty)
                      ? Colors.grey
                      : Colors.black),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Save Request',
                style: TextStyle(fontWeight: FontWeight.normal),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Fill in Who you'd like to invite.Your request will be sent to your admin for approval",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            child: Column(
              children: [
                TextField(
                  controller: p_mail_controller,
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
                      suffixIcon: p_mail_controller.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.cancel_outlined),
                              onPressed: (() => p_mail_controller.text = ''))
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
                    controller: a_mail_controller,
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
                if (p_mail_controller.text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 16),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                if (p_mail_controller.text.isNotEmpty)
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
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )),
          )

              //  ListTile(
              //   contentPadding: EdgeInsets.only(left: 11),
              //   // dense: true,
              //   // visualDensity: VisualDensity(horizontal: -1),
              //   leading: Icon(
              //     Icons.person,
              //     color: Colors.red,
              //   ),
              //   title: Text(
              //     textAlign: TextAlign.left,
              //     'Contacts',
              //     style: TextStyle(fontWeight: FontWeight.normal),
              //   ),
              // ),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Slack is better with others.  ',
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
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
