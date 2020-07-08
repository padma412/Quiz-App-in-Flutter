import './quiz.dart';
import 'package:flutter/material.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color',
      'answers': [
        {'text': 'White', 'score': 5},
        {'text': 'Pink', 'score': 4},
        {'text': 'Voilet', 'score': 3},
        {'text': 'Green', 'score': 4},
      ]
    },
    {
      'questionText': 'what\'s your favourite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Lion', 'score': 5},
        {'text': 'Cheetha', 'score': 5},
      ]
    },
    {
      'questionText': 'who\'s your Inspiration',
      'answers': [
        {'text': 'M.S.Dhoni', 'score': 5},
        {'text': 'Abdul Kalam', 'score': 5},
        {'text': 'yourSelf', 'score': 5},
        {'text': 'Einstien', 'score': 5},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
                : Result(_totalscore, _resetQuiz)));
  }
}