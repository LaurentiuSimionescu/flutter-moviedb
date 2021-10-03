import 'package:flutter/material.dart';
import 'package:moviedb/models/movie.dart';
import 'package:moviedb/ui/widgets/network_image_widget.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;

  const MovieItemWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NetworkImageWidget(
                  path: movie.poster_path,
                  smallImage: true,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    movie.title ?? '...',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          const Flexible(
            flex: 1,
            child: Icon(
              Icons.chevron_right,
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}
