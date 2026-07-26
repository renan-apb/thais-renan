import 'package:flutter/material.dart';

import 'core/content/wedding_content.dart';
import 'core/theme/app_theme.dart';
import 'features/home/home_page.dart';

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: WeddingContent.appTitle,
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
