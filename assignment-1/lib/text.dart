import 'package:flutter/material.dart';
class TextShow extends StatelessWidget {
  final String text;
  TextShow({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),      
      )
    );
  }
}