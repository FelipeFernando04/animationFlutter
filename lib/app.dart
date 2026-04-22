import 'package:flutter/material.dart';

import 'screens/gallery_screen.dart';
import 'theme/app_theme.dart';

class AnimatedGalleryApp extends StatelessWidget {
  const AnimatedGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Gallery Screen',
      theme: AppTheme.lightTheme,
      home: const GalleryScreen(),
    );
  }
}
