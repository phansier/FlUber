import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoritesScreen extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved;

  FavoritesScreen(this._saved);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = _saved.map(
      (WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: new ListView(children: divided),
    );
  }
}
