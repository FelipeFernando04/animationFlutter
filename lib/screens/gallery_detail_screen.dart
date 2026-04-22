import 'package:flutter/material.dart';

import '../models/gallery_item.dart';
import '../widgets/gallery_hero_image.dart';

class GalleryDetailScreen extends StatelessWidget {
  const GalleryDetailScreen({
    super.key,
    required this.item,
  });

  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GalleryHeroImage(item: item, height: 260, borderRadius: 24),
            const SizedBox(height: 16),
            Text(item.title, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(item.subtitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            Text(item.description, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 20),
            Chip(
              label: Text('Price: ${item.price}'),
              avatar: const Icon(Icons.local_offer_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
