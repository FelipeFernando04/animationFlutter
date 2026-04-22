import 'package:flutter/material.dart';

import '../models/gallery_item.dart';

class GalleryHeroImage extends StatelessWidget {
  const GalleryHeroImage({
    super.key,
    required this.item,
    this.height = 210,
    this.borderRadius = 20,
  });

  final GalleryItem item;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.network(
          item.imageUrl,
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
