import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String? _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // bottom: Divider(),
            shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.cancel,
                  size: 30,
                  color: Colors.black,
                )),
            title: Column(
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'AgiraTech',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 30,
                ),
              )
            ]),
        body: Column(
          children: [
            SizedBox(
              // padding: EdgeInsets.only(left: 5),
              height: 60,
              child: PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    _selection = value;
                  });
                },
                child: ListTile(
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'On mobile ,notify me about...',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      Text(_selection == null
                          ? 'All new messags'
                          : _selection.toString()),
                    ],
                  ),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'All new messags',
                    child: Text('All new messags'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Direct messages,mentions & keywords',
                    child: Text('Direct messages,mentions & keywords'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Noting',
                    child: Text('Noting'),
                  ),
                ],
              ),
            ),

            // ListTile(
            //   onTap: () => {
            //     PopupMenuButton(
            //         // onSelected:(value){ (value==1)},

            //         itemBuilder: (context) => [
            //               const PopupMenuItem(child: Text('All new messages')),
            //               const PopupMenuItem(child: Text('All new messages')),
            //               const PopupMenuItem(child: Text('All new messages')),
            //             ])
            //   },
            //   title: Text("On mobile notify about"),
            //   subtitle: Text('data'),
            // ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Notify me on mobile'),
              subtitle: Text('data'),
            )
          ],
        ));
  }
}
