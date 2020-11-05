import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
class Quiz extends StatelessWidget {
  final Map<String,Object> question;
  final Function answerQuestion;
  Quiz({this.question,this.answerQuestion});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question["questionText"]),
        ...(question["answer"] as List<Map<String,Object>>).map((answer) {
          return Answer(answerText: answer['text'], answerQuestion: ()=>answerQuestion(answer['score']));
        }).toList()
      ],
    );
  }
}
