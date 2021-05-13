import 'package:flutter/material.dart';
import 'package:the_movie_db/models/Movie.dart';
import 'package:the_movie_db/network/Api.dart';
import 'package:the_movie_db/widgets/ListItem.dart';
import 'package:the_movie_db/widgets/MovieSearch.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> items = [];
  bool isLoading = false;
  HttpService api;
  static int pageCount;

  Future _loadData() async {
    await api.getPlayingMovies(pageCount).then((value) => items.addAll(value));
    pageCount += 1;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    api = HttpService();
    pageCount = 1;
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: MovieSearch(items));
              })
        ],
      ),
      body: Column(
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
      ),
    );
  }
}
