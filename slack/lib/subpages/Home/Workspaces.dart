import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Workspaces extends StatefulWidget {
  const Workspaces({super.key});

  @override
  State<Workspaces> createState() => _WorkspacesState();
}

class _WorkspacesState extends State<Workspaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Transform.rotate(
              angle: 0.8,
              child: Icon(
                Icons.add,
                size: 30,
              )),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add a Workspaces',
          style: GoogleFonts.notoSans(),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.mail_outline_rounded),
            title: Text('madhan.k@agiratech.com'),
            trailing: Icon(Icons.error_outline),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, right: 10),
            child: Text(
                "You're signed in to all of the workspaces for this email address"),
          ),
          // OutlinedButton.icon( icon: Icons.add, onPressed: (){}, child: child)
          Container(
            // color: Colors.red,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 5),
              onTap: () {},
              leading: Container(
                child: Icon(Icons.add),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)),
              ),
              title: Text(
                'Other woekspaces you can join',
                style: GoogleFonts.notoSans(),
              ),
              subtitle: Text(
                '9 workspaces',
                style: GoogleFonts.notoSans(),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17, top: 10),
                child: Text(
                  "Not the workspaces you're looking for?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  alignment: Alignment.centerLeft,
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.workspaces_outlined),
                label: Text(
                  'Sign in to another workspace',
                  style: GoogleFonts.notoSans(color: Colors.black),
                )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  alignment: Alignment.centerLeft,
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.person_add_alt),
                label: Text(
                  'Join another workspace',
                  style: GoogleFonts.notoSans(color: Colors.black),
                )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  alignment: Alignment.centerLeft,
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text(
                  'Create new workspace',
                  style: GoogleFonts.notoSans(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
