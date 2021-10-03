import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:moviedb/bloc/movies/movies_bloc.dart';
import 'package:moviedb/bloc/movies/movies_state.dart';
import 'package:moviedb/ui/screens/movie_details_screen.dart';
import 'package:moviedb/ui/widgets/movie_item_widget.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  Widget appBarTitle = const Text(
    "Movie Viewer",
    style: TextStyle(color: Colors.white),
  );

  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.white,
  );

  final TextEditingController _searchQuery = TextEditingController();

  late bool _IsSearching;
  late BuildContext blocContext;
  var page = 1;

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
  }

  @override
  void dispose() {
    super.dispose();
    _searchQuery.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = const Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  appBarTitle = TextField(
                    controller: _searchQuery,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    autofocus: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (input) {
                      _handleSearchStart();
                    },
                    // onEditingComplete: () {
                    //
                    // },
                  );
                  // _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocProvider<MoviesBloc>(
          create: (context) =>
              MoviesBloc()..add(FetchMoviesListEvent(page: page)),
          child: BlocConsumer<MoviesBloc, MoviesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              blocContext = context;
              if (state.isLoading && state.movies.isEmpty) {
                return _buildLoadingWidget();
              }

              if (state.isError && state.movies.isEmpty) {
                return _buildErrorWidget();
              }

              return LoadMore(
                onLoadMore: _loadMore,
                whenEmptyLoad: false,
                delegate: DefaultLoadMoreDelegate(),
                textBuilder: DefaultLoadMoreTextBuilder.english,
                child: ListView.separated(
                  itemCount: _IsSearching
                      ? state.searchList.length
                      : state.movies.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movie: _IsSearching
                                  ? state.searchList[index]
                                  : state.movies[index],
                            ),
                          ),
                        );
                      },
                      child: MovieItemWidget(
                        movie: _IsSearching
                            ? state.searchList[index]
                            : state.movies[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _loadMore() async {
    Future.delayed(const Duration(milliseconds: 1000));
    print("Load Page $page");
    page = page + 1;
    BlocProvider.of<MoviesBloc>(blocContext)
        .add(FetchMoviesListEvent(page: page));
    return true;
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Text('Loading movies...'),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(
      child: Text('Oops! Something went wrong!'),
    );
  }

  void _handleSearchStart() {
    BlocProvider.of<MoviesBloc>(blocContext)
        .add(SearchMovieEvent(_searchQuery.text.toString().trim()));
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(
        Icons.search,
        color: Colors.white,
      );
      appBarTitle = const Text(
        "Movie Viewer",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}
