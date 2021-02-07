import 'package:flutter/material.dart';
import 'package:flutter_guide/result.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'Text': 'Black', 'score': 10},
        {'Text': 'Yellow', 'score': 6},
        {'Text': 'Green', 'score': 2},
        {'Text': 'Blue', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'Text': 'Cow', 'score': 10},
        {'Text': 'Chicken', 'score': 5},
        {'Text': 'horse', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'Text': 'KD', 'score': 1},
        {'Text': 'Pizza', 'score': 5},
        {'Text': 'Butter Chicken', 'score': 10},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
