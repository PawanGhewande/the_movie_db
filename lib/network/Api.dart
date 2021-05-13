import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:the_movie_db/models/Movie.dart';

class HttpService {
  final String playingMoviesUrl =
      "https://api.themoviedb.org/3/movie/now_playing?";
  final String searchMovieUrl = "https://api.themoviedb.org/3/search/movie?";

  Future<List<Movie>> getPlayingMovies(int page) async {
    try {
      var dio = Dio();
      Map<String, dynamic> payload = {
        "api_key": "YOUR_API_KEY",
        "language": "en-US",
        "page": page
      };
      var response = await dio.get(playingMoviesUrl, queryParameters: payload);
      if (response.statusCode == 200 &&
          jsonDecode(jsonEncode(response.data))['total_results'] != 0) {
        List<dynamic> body = jsonDecode(jsonEncode(response.data))['results'];

        List<Movie> movies = body
            .map(
              (dynamic item) => Movie.fromJson(item),
            )
            .toList();
        return movies;
      } else {
        return [];
      }
    } catch (e) {
      throw "Something Went Wrong";
    }
  }

  Future<List<Movie>> searchMovie(String movie, int page) async {
    try {
      var dio = Dio();
      Map<String, dynamic> payload = {
        "query": movie,
        "api_key": "YOUR_API_KEY",
        "include_adult": false,
        "page": page
      };
      var response = await dio.get(searchMovieUrl + page.toString(),
          queryParameters: payload);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(jsonEncode(response.data))['results'];

        List<Movie> movies = body
            .map(
              (dynamic item) => Movie.fromJson(item),
            )
            .toList();
        return movies;
      } else {
        return [];
      }
    } catch (e) {
      throw "Something Went Wrong";
    }
  }
}
