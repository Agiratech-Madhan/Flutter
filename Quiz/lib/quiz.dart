// import 'dart:html';
// import './main.dart';
import 'package:flutter/material.dart';
// import 'main.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  // const Quiz({Key? key}) : super(key: key);
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  const Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        // margin: const EdgeInsets.only(top: 10.0),
        // Answer(_answerQuestion),
        // Answer(_answerQuestion),
        // Answer(_answerQuestion),
        // ...(questions[questionIndex]['answers'] as List<String>).map((answer) {

        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
      // mainAxisAlignment: MainAxisSize,
    );
  }
}
