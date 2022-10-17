import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './Invite.dart';

class SubBottomSheet extends StatefulWidget {
  // const SubBottomSheet({super.key});
// final BuildContext ctx;
//   SubBottomSheet({required this.ctx});

  @override
  State<SubBottomSheet> createState() => _SubBottomSheetState();
}

class _SubBottomSheetState extends State<SubBottomSheet> {
  var result = 1;
  void check(value) {
    setState(() {
      result = value;
    });
  }

  void Bottomsheet(BuildContext ctex) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: ctex,
      builder: (_) {
        return bottomsheetpage();
      },
    );
  }

  Container bottomsheetpage() {
    return Container(
      height: 180,
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 5),
              width: 60,
              height: 3,
              decoration: const BoxDecoration(
                border: BorderDirectional(
                    top: BorderSide(width: 5, color: Colors.grey)),
              )),
          Container(
              margin: const EdgeInsets.only(top: 25, left: 15),
              alignment: Alignment.centerLeft,
              child: const Text('Sort by')),
          ListTile(
            leading: const Icon(Icons.list_alt_rounded),
            title: const Text("Sections"),
            trailing: Radio<dynamic>(
              value: 1,
              groupValue: result,
              onChanged: (x) => check(x),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: const Icon(Icons.access_time_rounded),
            title: const Text("Recent activity"),
            trailing: Radio<dynamic>(
                value: 2, groupValue: result, onChanged: (x) => check(x)),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Bottomsheet(context);
        },
        icon: const Icon(Icons.filter_list));
  }
}
