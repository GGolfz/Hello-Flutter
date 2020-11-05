import 'package:flutter/material.dart';

class ControlText extends StatelessWidget {
  final Function changeText;
  ControlText({this.changeText});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(child: Text("Change Text"), onPressed: changeText));
  }
}
