import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class StartupNames extends StatelessWidget {
    StartupNames({
        @required this.toggleFavorite,
        @required this.generateMoreNames,
        @required this.generatedNames,
        @required this.favoriteNames,
    });

    final Function toggleFavorite;
    final Function generateMoreNames;
    final List<WordPair> generatedNames;
    final Set<WordPair> favoriteNames;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Startup Names List'),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.list),
                        onPressed: () => Navigator.pushNamed(context, '/favorites'),
                    ),
                ],
            ),
            body: ListView.builder(
                itemBuilder: (context, index) {
                    if (index.isOdd) return Divider();

                    final int wordIndex = index ~/ 2;

                    if (wordIndex >= generatedNames.length) {
                        generateMoreNames();
                    }

                    final WordPair name = generatedNames[wordIndex];
                    final bool isFavorite = favoriteNames.contains(name);

                    return ListTile(
                        title: Text(name.asPascalCase),
                        trailing: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                        ),
                        onTap: () => toggleFavorite(name),
                    );
                },
            ),
        );
    }
}
