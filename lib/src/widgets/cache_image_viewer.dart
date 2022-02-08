import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageViewer extends StatelessWidget {
  final String imageUrl;
  const CacheImageViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (_, __, ___) => const Center(
          child: CircularProgressIndicator(
        strokeWidth: 0.3,
      )),
    );
  }
}
