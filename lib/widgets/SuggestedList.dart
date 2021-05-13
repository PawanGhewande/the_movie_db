import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/models/Movie.dart';
import 'package:the_movie_db/network/Api.dart';

import 'ListItem.dart';

class SuggestedList extends StatefulWidget {
  final String movieName;
  final List<Movie> localSuggetion;

  const SuggestedList({Key key, this.movieName, this.localSuggetion})
      : super(key: key);

  @override
  _SuggestedListState createState() =>
      _SuggestedListState(query: movieName, localSuggetion: localSuggetion);
}

class _SuggestedListState extends State<SuggestedList> {
  final String query;
  final List<Movie> localSuggetion;

  _SuggestedListState({this.query, this.localSuggetion});

  List<Movie> items = [];
  bool isLoading = false;
  HttpService api;
  int pageCount;

  @override
  void initState() {
    api = HttpService();
    pageCount = 1;
    //items.addAll(localSuggetion);
    _loadData();
    super.initState();
  }

  Future _loadData() async {
    await api
        .searchMovie(query, pageCount)
        .then((value) => items.addAll(value));
    pageCount += 1;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: NotificationListener<ScrollNotification>(
              // ignore: missing_return
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadData();
                  // start loading data
                  setState(() {
                    isLoading = true;
                  });
                }
              },
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    item: items[index],
                  );
                },
              )),
        ),
        Container(
          height: isLoading ? 50.0 : 0,
          color: Colors.transparent,
          child: Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
