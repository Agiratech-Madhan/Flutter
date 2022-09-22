// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Result extends StatelessWidget {
  // const Result({Key? key}) : super(key: key);
  final int resultScore;
  final VoidCallback resetHandler;
  const Result(this.resultScore, this.resetHandler);

  String get resultPharse {
    // String resultText;
    // var resultText = "you did it";
    String resultText;

    if (resultScore <= 8) {
      resultText = 'your awesome';
    } else if (resultScore <= 12) {
      resultText = 'preety good';
    } else {
      resultText = 'so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPharse,
          style: const TextStyle(
            fontSize: 36,
          ),
          textAlign: TextAlign.center,
        ),
        Center(
          child: ElevatedButton(
              onPressed: resetHandler,
              child: const Text('Restart Quiz',
                  style: TextStyle(color: Color.fromARGB(255, 44, 45, 46)))),
        )
      ],
    ));
  }
}
