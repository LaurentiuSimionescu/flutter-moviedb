class Apis {
  static const _api_key = '4ff9d08260ed338797caa272d7df35dd';

  static const String popularMovies =
      '/3/discover/movie?sort_by=popularity.desc&api_key=$_api_key';
  static const String searchMovie = '/3/search/movie?api_key=$_api_key';
}
