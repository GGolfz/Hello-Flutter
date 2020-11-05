import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;
  Result({this.score,this.resetQuiz});

  String get resultPhrase {
    var resultText = 'You did it!';
    if (score <= 16) {
      resultText = 'You are awesome and innocent!';
    } else if (score <= 20) {
      resultText = 'Pretty likable!';
    } else if (score <= 24) {
      resultText = 'You are ... Strange ?!';
    } else {
      resultText = 'You are very good !!!';
    }
    return resultText + ' '+ score.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Text(resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          FlatButton(child: Text("Restart"), textColor: Colors.blue, onPressed: resetQuiz)
        ]
    )
    );
  }
}
