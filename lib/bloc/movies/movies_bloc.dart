import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviedb/bloc/movies/movies_state.dart';
import 'package:moviedb/models/movie.dart';
import 'package:moviedb/repositories/retrofit/api_client.dart';
import 'package:moviedb/util/networks_utils.dart';

part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  late ApiClient client;

  MoviesBloc({ApiClient? client}) : super(MoviesState.empty()) {
    this.client = client ?? NetworkUtils.defaultApiClient();
  }

  factory MoviesBloc.mockClient() {
    return MoviesBloc(client: NetworkUtils.mockApiClient());
  }

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    switch (event.runtimeType) {
      case FetchMoviesListEvent:
        yield* _mapFetchMoviesListEventToState(event as FetchMoviesListEvent);
        break;
      case SearchMovieEvent:
        yield* _mapSearchMovieEventToState(event as SearchMovieEvent);
        break;
    }
  }

  Stream<MoviesState> _mapFetchMoviesListEventToState(
      FetchMoviesListEvent event) async* {
    yield state.copyWith(isLoading: true);

    try {
      final result = await client.getMostPopularMovies(event.page);

      var movies = <Movie>[];
      movies.addAll(state.movies);
      if (result.results != null && result.results!.isNotEmpty) {
        movies.addAll(result.results!);
      }

      yield state.copyWith(
        isLoading: false,
        isSuccess: true,
        isError: false,
        movies: movies,
      );
    } catch (exception) {
      print(exception);
      yield state.copyWith(
        isLoading: false,
        isSuccess: false,
        isError: true,
      );
    }
  }

  Stream<MoviesState> _mapSearchMovieEventToState(
      SearchMovieEvent event) async* {
    try {
      final result = await client.searchMovie(event.query);

      yield state.copyWith(
        isLoading: false,
        isSuccess: true,
        isError: false,
        searchList: result.results ?? <Movie>[],
      );
    } catch (exception) {
      print(exception);
      yield state.copyWith();
    }
  }
}
