import 'models/Movie.dart';

class RoutePath {
  final String id;

  final Movie movie;

  RoutePath.home()
      : id = "home",
        movie = null;

  RoutePath.homeDetails(Movie movie)
      : id = "homeDetails",
        movie = movie;

  // expose the pages to be used by application
  bool get isHome => id == 'home';

  bool get isHomeDetails => id == 'homeDetails';
}
