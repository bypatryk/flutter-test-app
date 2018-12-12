import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Welcome to Flutter',
            home: RandomWords(),
        );
    }
}

class RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Startup Name Generator'),
            ),
            body: _buildSuggestions(),
        );
    }

    Widget _buildSuggestions() {
        return ListView.builder(
            padding: const EdgeInsets.all(16.0),
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
        return ListTile(
            title: Text(pair.asPascalCase),
        );
    }
}

class RandomWords extends StatefulWidget {
    @override
    RandomWordsState createState() => new RandomWordsState();
}
