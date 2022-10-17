import 'package:flutter/material.dart';
import 'package:slack/models/Notify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  String result = '${notifyme[1].notify}';
  String? mainresult;
  void Changes(String value) {
    setState(() {
      // print("vdz");
      result = value;
    });
    mainresult = result;
  }

  bool _selected = true;
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notify me on mobile...'),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioListTile(
                    // selected: _selected,
                    title: Text('${notifyme[0].notify}'),
                    value: '${notifyme[0].notify}',
                    groupValue: 1,
                    onChanged: (value) {
                      return Changes(value.toString());
                    }),
                RadioListTile(
                    title: Text('${notifyme[1].notify}'),
                    value: '${notifyme[1].notify}',
                    groupValue: 2,
                    onChanged: (value) {
                      return Changes(value.toString());
                    }),
                RadioListTile(
                    title: Text('${notifyme[2].notify}'),
                    value: '${notifyme[2].notify}',
                    groupValue: 3,
                    onChanged: (value) {
                      return Changes(value.toString());
                    }),
                RadioListTile(
                    title: Text('${notifyme[3].notify}'),
                    value: '${notifyme[3].notify}',
                    groupValue: 4,
                    onChanged: (value) {
                      return Changes(value.toString());
                    }),
                RadioListTile(
                    title: Text('${notifyme[4].notify}'),
                    value: '${notifyme[4].notify}',
                    groupValue: 5,
                    onChanged: (value) {
                      return Changes(value.toString());
                    }),
                RadioListTile(
                    title: Text('${notifyme[5].notify}'),
                    value: '${notifyme[5].notify}',
                    groupValue: 6,
                    onChanged: (value) {
                      return Changes(value.toString());
                    }),
                RadioListTile(
                    title: Text('${notifyme[6].notify}'),
                    value: '${notifyme[6].notify}',
                    groupValue: 7,
                    onChanged: (value) {
                      return Changes(value.toString());
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Text('CANCEL')),
                    TextButton(
                        onPressed: () {
                          mainresult = result;
                          Navigator.pop(context);
                          print(mainresult);
                        },
                        child: Text('SAVE'))
                  ],
                ),
              ],
            )
          ],
          // content: ListView(
          //   children: [
          //     RadioListTile(
          //         // selected: true,
          //         title: Text('Madhan'),
          //         value: 'Madhan',
          //         groupValue: 1,
          //         onChanged: (value) {
          //           return Changes(value.toString());
          //         }),
          // RadioListTile(
          //     title: Text('Madhan'),
          //     value: 'Nadhan2',
          //     groupValue: 1,
          //     onChanged: (value) {
          //       return Changes(value.toString());
          //     })
          //   ],

          // ),
          // actions: [],
          // actions: [
          // ListView.builder(
          //   itemCount: notifyme.length,
          //   itemBuilder: (context, index) => RadioListTile(
          //       value: notifyme[index].notify,
          //       groupValue: notifyme[index].notify,
          //       onChanged: (_) {}),
          // )
          // ],

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     RadioListTile(
          //         activeColor: Colors.blue,
          //         title: const Text('Madhan'),
          //         value: 1,
          //         groupValue: result,
          //         onChanged: (value) => Changes(value.toString())),

          //   ]
          // )
        );
      },
    );
  }

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
              SizedBox(
                height: 60,
                child: ListTile(
                  onTap: () => _dialogBuilder(context),
                  title: Text('Notify me on mobile',
                      style: GoogleFonts.notoSans()),
                  subtitle: Text('$mainresult', style: GoogleFonts.notoSans()),
                ),
              ),
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
