import 'package:flutter/material.dart';

import '../models/gallery_item.dart';
import 'gallery_hero_image.dart';

class GalleryCard extends StatefulWidget {
  const GalleryCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final GalleryItem item;
  final VoidCallback onTap;

  @override
  State<GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard> {
  bool _isPressed = false;

  void _handleHighlightChanged(bool value) {
    if (_isPressed == value) return;

    setState(() {
      _isPressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: _isPressed
            ? scheme.primaryContainer.withValues(alpha: 0.35)
            : scheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: _isPressed
              ? scheme.primary.withValues(alpha: 0.30)
              : scheme.outlineVariant.withValues(alpha: 0.50),
        ),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: _isPressed ? 0.10 : 0.04),
            blurRadius: _isPressed ? 20 : 12,
            offset: Offset(0, _isPressed ? 8 : 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          onHighlightChanged: _handleHighlightChanged,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GalleryHeroImage(
                  item: widget.item,
                  height: 180,
                  borderRadius: 16,
                ),
                const SizedBox(height: 12),
                Text(widget.item.title, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(widget.item.subtitle, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.price,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: scheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      height: 44,
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOut,
                        alignment: _isPressed
                            ? Alignment.centerRight
                            : Alignment.center,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeOut,
                          opacity: _isPressed ? 1 : 0.72,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: scheme.primary.withValues(alpha: 0.10),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: scheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}