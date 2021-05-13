import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_movie_db/models/Movie.dart';
import 'package:the_movie_db/widgets/landscape_details_screen.dart';
import 'package:the_movie_db/widgets/portrait_details_screen.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  MovieDetail({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Details"),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? PortraitDetailsScreen(
                    movie: movie,
                  )
                : LandscapeDetailsPage(
                    movie: movie,
                  );
          },
        ));
  }
}
