import 'package:flutter/material.dart';

import '../models/gallery_item.dart';
import 'gallery_hero_image.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final GalleryItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GalleryHeroImage(item: item, height: 180, borderRadius: 16),
              const SizedBox(height: 12),
              Text(item.title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(item.subtitle, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(
                item.price,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
