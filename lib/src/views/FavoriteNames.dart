import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoriteNames extends StatelessWidget {
    FavoriteNames({
        @required this.favoriteNames,
    });

    final Set<WordPair> favoriteNames;

    @override
    Widget build(BuildContext context) {
        final names = favoriteNames.toList();

        return Scaffold(
            appBar: AppBar(
                title: Text('Favorite Names'),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(names[index].asPascalCase),
                    );
                },
                separatorBuilder: (context, index) {
                    return Divider();
                },
                itemCount: favoriteNames.length,
            ),
        );
    }
}
