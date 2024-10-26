import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageBox extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final double borderRadius;
  const ImageBox({
    super.key,
    required this.url,
    this.height = 100,
    this.width = 133,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
          height: height,
          width: width,
          child: Skeleton.replace(
            replacement: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const SizedBox(
                width: 100,
                height: 133,
                child: ColoredBox(color: Colors.black),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) => Skeletonizer(
                enabled: true,
                child: ImageBox(
                  height: height,
                  width: width,
                  url: url,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.error,
                  )),
            ),
          )),
    );
  }
}
