import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

// https://developers.themoviedb.org/3/movies/get-popular-movies

@JsonSerializable()
class Movie {
  bool? adult;
  String? backdrop_path;
  List<int>? genreIds;
  int? id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  Movie({
    this.adult,
    this.backdrop_path,
    this.genreIds,
    this.id,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.release_date,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
