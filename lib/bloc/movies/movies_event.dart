part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class FetchMoviesListEvent extends MoviesEvent {
  final int page;

  FetchMoviesListEvent({required this.page});
}

class SearchMovieEvent extends MoviesEvent {
  final String query;

  SearchMovieEvent(this.query);
}
