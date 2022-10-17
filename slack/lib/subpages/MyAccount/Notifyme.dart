import 'package:flutter/material.dart';
import 'package:slack/models/Notify.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifyme extends StatefulWidget {
  const Notifyme({super.key});

  @override
  State<Notifyme> createState() => _NotifymeState();
}

class _NotifymeState extends State<Notifyme> {
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
                // ListTile(
                //     // onTap: () => Navigator.pop(context),
                //     title: Text("small"),
                //     leading: Radio(
                //         value: "Small",
                //         groupValue: result,
                //         onChanged: (value) => Changes(value.toString()))),
                // SizedBox(
                //   width: 10.0,
                // ),
                RadioListTile(
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        onTap: () => _dialogBuilder(context),
        title: Text('Notify me on mobile', style: GoogleFonts.notoSans()),
        subtitle: Text('$mainresult', style: GoogleFonts.notoSans()),
      ),
    );
  }
}
