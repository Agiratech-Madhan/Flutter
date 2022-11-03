// import 'package:flutter/material.dart';
// // import 'package:slack/models/Notify.dart';
// // import 'package:google_fonts/google_fonts.dart';

// class Notifyme extends StatefulWidget {
//   const Notifyme({super.key});

//   @override
//   State<Notifyme> createState() => _NotifymeState();
// }

// class _NotifymeState extends State<Notifyme> {
//   int notification_count = 0;
//   bool switchnotify = false;
//   String? _selection;
//   String result = '${notifyme[1].notify}';
//   String? mainresult;
//   void Changes(String value) {
//     setState(() {
//       // print("vdz");
//       result = value;
//     });
//   }

//   Future<void> _dialogBuilder(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Notify me on mobile...'),
//           content: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//             return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.6,
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: notifyme.length,
//                       itemBuilder: (context, index) => RadioListTile(
//                           title: Text(notifyme[index].notify),
//                           value: notifyme[index].notify,
//                           groupValue: result,
//                           onChanged: (value) {
//                             setState(() {
//                               Changes(value.toString());
//                             });
//                           }),
//                     ),
//                   )
//                 ]);
//           }),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                     onPressed: () => {Navigator.pop(context)},
//                     child: Text('CANCEL')),
//                 TextButton(
//                     onPressed: () {
//                       print('beforestate$mainresult');
//                       setState(() {
//                         mainresult = result;
//                       });

//                       Navigator.pop(context);
//                       print(mainresult);
//                     },
//                     child: Text('SAVE'))
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListTile(
//         onTap: () => _dialogBuilder(context),
//         // title: Text('Notify me on mobile', style: GoogleFonts.notoSans()),
//         // subtitle: Text('$mainresult', style: GoogleFonts.notoSans()),
//       ),
//     );
//   }
// }
// /**onTap: () {
//                             print('object');
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ChatScreen(
//                                         c_icon: sizedBox,
//                                         c_name: chatdata[i].name,
//                                         DM: true)));
//                           }, */