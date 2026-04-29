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
        title: const Text('Galeria Animada'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          Text('Escolhas tech para estudantes', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'Toque em qualquer card para ver os detalhes com transição Hero.',
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