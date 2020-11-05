import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function answerQuestion;
  Answer({this.answerText,this.answerQuestion});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.indigoAccent[400],
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: answerQuestion,
      )
    );
  }
}