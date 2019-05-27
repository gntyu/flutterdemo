// Step 4: Create an infinite scrolling lazily loaded list

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutterdemo/common/utils/HttpUtils.dart';

Dio dio = new Dio();

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      // debugShowMaterialGrid:true,
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set();
  final TextStyle _biggerFont = new TextStyle(
    fontSize: 18.0,
    fontFamily: 'RobotoMono',
  );
  final TextStyle _blueFont = new TextStyle(fontSize: 18.0, color: Colors.blue);
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (one) {
              return new ListTile(
                title: new Text(
                  one,
                  style: _blueFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('新路由'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  void getHttp() async {
    try {
      var result = await HttpUtil().get('/login');
      print(result);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('姓名生成器'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.favorite, color: Colors.red),
              onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index], index);
      },
    );
  }

  Widget _buildRow(WordPair pair, int inx) {
    final String _one = (inx + 1).toString() + ". " + pair.asPascalCase;
    final alreadySaved = _saved.contains(_one);
    return new ListTile(
      title: new Text(
        _one,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.black,
      ),
      onTap: () {
        print(_one);
        getHttp();
        setState(() {
          if (alreadySaved) {
            _saved.remove(_one);
          } else {
            _saved.add(_one);
          }
        });
      },
    );
  }
}
