import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final WordPair wordPair;
  final Function onClicked;
  final bool isFav;
  RowText({this.wordPair, this.onClicked, this.isFav});

  @override
  Widget build(BuildContext context) {
    final _wordPairStyle = TextStyle(fontSize: 18.0, color: Colors.blue);
    return ListTile(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        wordPair.asPascalCase,
        style: _wordPairStyle,
      ),
      IconButton(
          icon: this.isFav
              ? Icon(Icons.favorite, color: Colors.red[600])
              : Icon(Icons.favorite_border),
          onPressed: ()=>{onClicked(wordPair)})
    ]));
  }
}
