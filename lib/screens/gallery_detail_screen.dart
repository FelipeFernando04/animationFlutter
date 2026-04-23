import 'package:flutter/material.dart';

import '../models/gallery_item.dart';
import '../widgets/gallery_focus_panel.dart';
import '../widgets/gallery_hero_image.dart';

class GalleryDetailScreen extends StatefulWidget {
  const GalleryDetailScreen({
    super.key,
    required this.item,
  });

  final GalleryItem item;

  @override
  State<GalleryDetailScreen> createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 360),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curvedAnimation);

    _slideAnimation = Tween<double>(
      begin: 24,
      end: 0,
    ).animate(curvedAnimation);

    _scaleAnimation = Tween<double>(
      begin: 0.96,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showSavedMessage() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${widget.item.title} saved for later.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final item = widget.item;

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
            const SizedBox(height: 12),
            AnimatedBuilder(
              animation: _controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.subtitle, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  Text(item.description, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 20),
                  GalleryFocusPanel(
                    item: item,
                    onSave: _showSavedMessage,
                  ),
                ],
              ),
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, _slideAnimation.value),
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      alignment: Alignment.topCenter,
                      child: child,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
