class Movie {
  final bool adult;
  final String backdropPath;
  final int genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        adult: json['adult'] as bool ?? false,
        backdropPath: json['backdrop_path'] as String ?? 'N/A',
        //genreIds: json['genre_ids'] as int,
        id: json['id'] as int ?? 0,
        originalLanguage: json['original_language'] as String ?? 'N/A',
        originalTitle: json['original_title'] as String ?? 'N/A',
        overview: json['overview'] as String ?? 'N/A',
        popularity: json['popularity'] as double ?? 0,
        posterPath: json['poster_path'] as String ?? 'NA',
        releaseDate: json['release_date'] as String ?? 'NA',
        title: json['title'] as String ?? 'N/A',
        video: json['video'] as bool ?? false,
        voteAverage: json['vote_average'] as num ?? 0.0,
        voteCount: json['vote_count'] as int ?? 0);
  }
}
