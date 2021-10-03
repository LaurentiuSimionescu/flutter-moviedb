import 'package:dio/dio.dart';
import 'package:moviedb/models/response_data.dart';
import 'package:retrofit/http.dart';

import 'apis.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.popularMovies)
  Future<ResponseData> getMostPopularMovies(@Query("page") int page);

  @GET(Apis.searchMovie)
  Future<ResponseData> searchMovie(@Query("query") String query);

}
