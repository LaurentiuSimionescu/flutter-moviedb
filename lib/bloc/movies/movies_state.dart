import 'package:flutter/material.dart';
import 'package:moviedb/models/movie.dart';

@immutable
class MoviesState {
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final List<Movie> movies;
  final List<Movie> searchList;

  const MoviesState(
      {required this.isLoading,
      required this.isSuccess,
      required this.isError,
      required this.movies,
      required this.searchList});

  factory MoviesState.empty() {
    return const MoviesState(
      isLoading: false,
      isSuccess: false,
      isError: false,
      movies: <Movie>[],
      searchList: <Movie>[],
    );
  }

  MoviesState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    List<Movie>? movies,
    List<Movie>? searchList,
  }) {
    return MoviesState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      movies: movies ?? this.movies,
      searchList: searchList ?? <Movie>[],
    );
  }
}
