import 'package:flutter/material.dart';
import 'package:slack/models/Notify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slack/subpages/MyAccount/Notifyme.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // Color colors = Colors.blue;
  int notification_count = 0;
  bool switchnotify = false;
  String? _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifications',
                  style: GoogleFonts.notoSans(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'AgiraTech',
                  style: GoogleFonts.notoSans(
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // padding: EdgeInsets.only(left: 5),
                height: 70,
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
                          style: GoogleFonts.notoSans(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(_selection == null
                            ? 'All new messags'
                            : _selection.toString()),
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
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
              paddingdivider(),
              SizedBox(height: 60, child: Notifyme()),
              paddingdivider(),
              SizedBox(
                height: 70,
                child: ListTile(
                  title: Text('System options', style: GoogleFonts.notoSans()),
                  subtitle: Text('Choose sounds,vibration and importance',
                      style: GoogleFonts.notoSans()),
                ),
              ),
              paddingdivider(),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 10),
                child: TextButton(
                    onPressed: () {},
                    child: Text('Troubleshoot notifications',
                        style: GoogleFonts.notoSans())),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('General settings',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  title: Text('Notification schedule',
                      style: GoogleFonts.notoSans()),
                  subtitle: Text('Everyday', style: GoogleFonts.notoSans()),
                ),
              ),
              paddingdivider(),
              ListTile(
                title: Text(
                  'Default reminder time',
                  style: GoogleFonts.notoSans(),
                ),
                subtitle: Text('9.00 AM', style: GoogleFonts.notoSans()),
              ),
              paddingdivider(),
              SwitchListTile(
                value: switchnotify,
                activeColor: Color(0xff002A36),
                onChanged: (value) {
                  setState(() {
                    switchnotify = value;
                  });
                },
                title: Text('Notify me about replies to threads',
                    style: GoogleFonts.notoSans()),
              ),
              paddingdivider(),
              ListTile(
                title:
                    Text('In-app notifications', style: GoogleFonts.notoSans()),
                subtitle: Text('In-app notifications appear while app is open',
                    style: GoogleFonts.notoSans()),
              ),
              paddingdivider(),
              ListTile(
                title: Text('My keywords'),
                subtitle: Text('Get notified whenever someone says...'),
              ),
              paddingdivider(),
              ListTile(
                title: Row(
                  children: [
                    Text('Channel-specific notifications '),
                    Text('($notification_count)'),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Padding paddingdivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}
