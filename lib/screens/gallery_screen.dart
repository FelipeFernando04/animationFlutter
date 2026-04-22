import 'package:flutter/material.dart';

import '../data/mock_gallery_items.dart';
import '../models/gallery_item.dart';
import '../widgets/gallery_card.dart';
import 'gallery_detail_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  void _openDetails(BuildContext context, GalleryItem item) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => GalleryDetailScreen(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Gallery'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          Text('Tech picks for students', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'Tap any card to view details with a Hero transition.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          ...mockGalleryItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GalleryCard(
                item: item,
                onTap: () => _openDetails(context, item),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
