import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //_ means private
  static const _questions = [
    {
      'questionText': 'What is your name',
      // 'answers': ['Black', 'Pink', 'Yellow'],
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'pink', 'score': 5},
        {'text': 'white', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your animal',
      // 'answers': ['rabit', 'lion', 'rat'],
      'answers': [
        {'text': 'rabit', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'deer', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your singer',
      // 'answers': ['U1', 'U2', 'U3'],
      'answers': [
        {'text': 'u1', 'score': 10},
        {'text': 'u2', 'score': 5},
        {'text': 'u3', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;

  var _totalScore = 0;
  int _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    return 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questions.length);

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more _questions');
    } else {
      print('no more _questions');
    }
    // print('answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        padding: const EdgeInsets.all(0.0),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My first app'),
          ),
          body: _questionIndex < _questions.length
              // print()
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              // mainAxisAlignment: MainAxisSize,
              // ignore: prefer_const_constructors
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
