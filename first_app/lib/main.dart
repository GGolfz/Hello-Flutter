import 'package:first_app/row_text.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  var favList = Set<WordPair>();
  void _modifyFav(WordPair wordPair) {
    setState(() {
      if (favList.contains(wordPair)) {
        favList.remove(wordPair);
      } else {
        favList.add(wordPair);
      }
    });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final tiles = favList.map((WordPair pair) {
        return ListTile(
            title:
                Text(pair.asPascalCase, style: TextStyle(color: Colors.pink)));
      });
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return Scaffold(
          appBar: AppBar(title: Text('Saved List')),
          body: ListView(children: divided));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Word Generator"),
          actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
        ),
        body: _buildSuggestion());
  }

  Widget _buildSuggestion() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair wordPair) {
    return RowText(
        wordPair: wordPair,
        onClicked: _modifyFav,
        isFav: favList.contains(wordPair));
  }
}
