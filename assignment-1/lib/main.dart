// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';
import './text.dart';
import './textControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "Hello World!";
  void _changeText() {
    if (text == "Hello World!") {
      setState(() {
        text = "Hello Flutter!";
      });
    } else {
      setState(() {
        text = "Hello World!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Assignment"),
      ),
      body: Container(
          padding: EdgeInsets.all(30.0),
          width: double.infinity,
          child: Column(
            children: [
              TextShow(
                text: text,
              ),
              ControlText(
                changeText: _changeText,
              )
            ],
          )),
    ));
  }
}
