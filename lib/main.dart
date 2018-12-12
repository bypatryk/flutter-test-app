import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Welcome to Flutter',
            theme: new ThemeData(
                primaryColor: Colors.white,
            ),
            home: RandomWords(),
        );
    }
}

class RandomWordsState extends State<RandomWords> {
    final List<WordPair> _suggestions = <WordPair>[];
    final Set<WordPair> _saved = new Set<WordPair>();

    void _pushSaved() {
        Navigator.of(context).push(
            new MaterialPageRoute(
                builder: (BuildContext context) {
                    final Iterable<ListTile> tiles = _saved.map(
                        (WordPair pair) {
                            return new ListTile(
                                title: new Text(pair.asPascalCase),
                            );
                        },
                    );

                    final List<Widget> divided = ListTile
                        .divideTiles(
                            context: context,
                            tiles: tiles,
                        )
                        .toList();

                    return new Scaffold(
                        appBar: new AppBar(
                            title: new Text('Saved Suggestions'),
                        ),
                        body: new ListView(children: divided),
                    );
                },
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Startup Name Generator'),
                actions: <Widget>[
                    new IconButton(
                        icon: new Icon(Icons.list),
                        onPressed: _pushSaved,
                    ),
                ],
            ),
            body: _buildSuggestions(),
        );
    }

    Widget _buildSuggestions() {
        return ListView.builder(
            // padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
                if (index.isOdd) return Divider();

                final wordIndex = index ~/ 2;

                if (wordIndex >= _suggestions.length) {
                    _suggestions.addAll(generateWordPairs().take(10));
                }

                return _buildRow(_suggestions[wordIndex]);
            },
        );
    }

    Widget _buildRow(WordPair pair) {
        final bool alreadySaved = _saved.contains(pair);

        return ListTile(
            title: Text(pair.asPascalCase),
            trailing: new Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
            ),
            onTap: () {
                setState(() {
                    if (alreadySaved) {
                        _saved.remove(pair);
                    } else {
                        _saved.add(pair);
                    }
                });
            }
        );
    }
}

class RandomWords extends StatefulWidget {
    @override
    RandomWordsState createState() => new RandomWordsState();
}
