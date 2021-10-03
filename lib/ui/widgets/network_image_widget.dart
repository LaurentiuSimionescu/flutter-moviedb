import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/util/image_utils.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? path;
  final bool smallImage;

  const NetworkImageWidget({
    Key? key,
    required this.path,
    this.smallImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return smallImage ? _buildSmallImage() : _buildLargeImage();
  }

  Widget _buildLargeImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: path == null || path!.isEmpty
          ? _buildPlaceholderWidget()
          : CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: getLargeImageUrl(imagePath: path!),
              placeholder: (context, url) => _buildPlaceholderWidget(),
              errorWidget: (context, string, dynamic) =>
                  _buildPlaceholderWidget(),
            ),
    );
  }

  Widget _buildSmallImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: path == null || path!.isEmpty
          ? _buildPlaceholderWidget()
          : CachedNetworkImage(
              width: 36,
              height: 36,
              fit: BoxFit.cover,
              imageUrl: getSmallImageUrl(imagePath: path!),
              placeholder: (context, url) => _buildPlaceholderWidget(),
              errorWidget: (context, string, dynamic) =>
                  _buildPlaceholderWidget(),
            ),
    );
  }

  Widget _buildPlaceholderWidget() {
    return const Icon(
      Icons.movie,
      color: Colors.red,
    );
  }
}
