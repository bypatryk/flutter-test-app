import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import './src/views/StartupNames.dart';
import './src/views/FavoriteNames.dart';

void main() => runApp(StartupNamesGeneratorApp());

class StartupNamesGeneratorApp extends StatefulWidget {
    @override
    StartupNamesGeneratorAppState createState() => new StartupNamesGeneratorAppState();
}

class StartupNamesGeneratorAppState extends State<StartupNamesGeneratorApp> {
    final List<WordPair> _generatedNames = <WordPair>[];
    final Set<WordPair> _favoriteNames = Set<WordPair>();

    void _generateMoreNames() {
        _generatedNames.addAll(generateWordPairs().take(10).toList());
    }

    void _toggleFavorite(WordPair name) {
        setState(() {
            if (_favoriteNames.contains(name)) {
                _favoriteNames.remove(name);
            } else {
                _favoriteNames.add(name);
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Startup Names Generator',
            initialRoute: '/',
            routes: {
                '/': (context) => StartupNames(
                    generatedNames: _generatedNames,
                    favoriteNames: _favoriteNames,
                    generateMoreNames: _generateMoreNames,
                    toggleFavorite: _toggleFavorite,
                ),
                '/favorites': (context) => FavoriteNames(
                    favoriteNames: _favoriteNames,
                ),
            },
            theme: ThemeData(
                primaryColor: Colors.white,
            ),
        );
    }
}
