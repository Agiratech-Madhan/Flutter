// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({Key? key}) : super(key: key);
  final String questionText;
  const Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
