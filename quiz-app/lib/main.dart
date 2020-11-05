import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

/*
void main(){
  runApp(MyApp());
}
*/
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answer": [
        {"text": "Green", "score": 10},
        {"text": "Blue", "score": 7},
        {"text": "Pink", "score": 8},
        {"text": "Orange", "score": 6},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {"text": "Lion", "score": 2},
        {"text": "Dog", "score": 8},
        {"text": "Cat", "score": 10},
        {"text": "Parrot", "score": 9},
      ]
    },
    {
      "questionText": "What's your favorite food",
      "answer": [
        {"text": "Pizza", "score": 10},
        {"text": "Hamburger", "score": 6},
        {"text": "Shabu", "score": 8},
        {"text": "Suki", "score": 9}
      ]
    }
  ];
  var _totalScore = 0;
  var _questionIndex = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    if (_questionIndex < questions.length) {
      _totalScore = _totalScore + score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('My First App')),
            body: Container(
                margin: new EdgeInsets.all(20.0),
                width: double.infinity,
                child: _questionIndex < questions.length
                    ? Quiz(
                        question: questions[_questionIndex],
                        answerQuestion: _answerQuestion)
                    : Result(score: _totalScore, resetQuiz: _resetQuiz))));
  }
}
