import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/favorites_screen.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
        new IconButton(icon: const Icon(Icons.menu), onPressed: _pushSaved),
      ]),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FavoritesScreen(_saved)));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        subtitle: Text('Subtitle'),
        trailing: new IconButton(
          icon: new Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onPressed: () {
            setState(() {
              if (alreadySaved) {
                _saved.remove(pair);
              } else {
                _saved.add(pair);
              }
            });
          },
        ));
  }
}
