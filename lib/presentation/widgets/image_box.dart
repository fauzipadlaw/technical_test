// ignore_for_file: public_member_api_docs, sort_constructors_first
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
            replacement: SkeletonReplacement(width, height),
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) => Skeletonizer(
                enabled: true,
                child: SkeletonReplacement(width, height),
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

class SkeletonReplacement extends StatelessWidget {
  final double width;
  final double height;
  const SkeletonReplacement(this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: width,
        height: height,
        child: const ColoredBox(color: Colors.black),
      ),
    );
  }
}
