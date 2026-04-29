import 'package:flutter/material.dart';
import '../models/gallery_item.dart';

class GalleryFocusPanel extends StatelessWidget {
  final GalleryItem item;
  final VoidCallback onSave;

  const GalleryFocusPanel({
    super.key,
    required this.item,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // Usando withValues para evitar o aviso de depreciação do withOpacity
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gostou desta imagem?',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Salve ${item.title} para ver depois.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          FilledButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.bookmark_add_outlined),
            label: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}