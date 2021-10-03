import 'package:json_annotation/json_annotation.dart';
import 'package:moviedb/models/movie.dart';

part 'response_data.g.dart';

// https://developers.themoviedb.org/3/movies/get-popular-movies
// Run command flutter pub run build_runner build to and follow terminal instructions
@JsonSerializable()
class ResponseData {
  int? page;
  List<Movie>? results;
  int? total_pages;
  int? total_results;

  ResponseData({
    this.page,
    this.results,
    this.total_pages,
    this.total_results,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
