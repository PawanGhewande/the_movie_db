import 'package:flutter/material.dart';
import 'package:the_movie_db/models/Movie.dart';

import 'SuggestedList.dart';

class MovieSearch extends SearchDelegate<String> {
  final List<Movie> listWords;

  MovieSearch(this.listWords);

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return SuggestedList(
      movieName: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listWords
        : listWords
            .where((p) => p.title.contains(RegExp(query, caseSensitive: false)))
            .toList();

    return SuggestedList(
      localSuggetion: suggestionList,
      movieName: query,
    );
  }
}
