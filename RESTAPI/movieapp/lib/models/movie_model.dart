// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movies {
  final List<MovieData> item;
  Movies({
    required this.item,
  });
  factory Movies.fromJson(Map<String, dynamic> json) {
    List movies = json['items'];
    List<MovieData> moviesData =
        movies.map((e) => MovieData.fromJson(e)).toList();
    return Movies(item: moviesData);
  }
}

class MovieData {
  String? backdropPath;

  final int? id;
  final String? mediaType;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  MovieData({
    required this.backdropPath,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
        backdropPath: json['backdropPath'],
        id: json['id'],
        mediaType: json['mediaType'],
        originalLanguage: json['originalLanguage'],
        originalTitle: json['originalTitle'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['posterPath'],
        releaseDate: json['releaseDate'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['voteAverage'],
        voteCount: json['voteCount']);
  }
}
