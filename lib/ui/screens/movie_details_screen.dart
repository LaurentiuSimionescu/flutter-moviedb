import 'package:flutter/material.dart';
import 'package:moviedb/models/movie.dart';
import 'package:moviedb/ui/widgets/network_image_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? ''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 600,
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: NetworkImageWidget(
                            path: movie.poster_path,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0,),
                          child: _buildMovieScore(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(movie.overview!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieScore() {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 46,
              height: 46,
              child: CircularProgressIndicator(
                value: movie.vote_average! / 10,
                color: Color(0xff10DC60),
              ),
            ),
          ),
          Center(
            child: Text(
              '${(movie.vote_average! * 10).round()} %',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
