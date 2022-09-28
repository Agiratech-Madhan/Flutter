import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Adaptivebutton extends StatelessWidget {
  final String txt;
  final VoidCallback btnhandler;
  Adaptivebutton(this.txt, this.btnhandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              "Choose Date",
              style: TextStyle(
                  // color: Theme.of(context).primaryColor,git
                  fontWeight: FontWeight.bold),
            ),
            onPressed: btnhandler,
          )
        : TextButton(
            onPressed: btnhandler,
            child: Text(
              "Choose Date",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            // style: TextButton.styleFrom(
            //     foregroundColor: Color.fromARGB(255, 76, 89, 175)),
          );
  }
}
