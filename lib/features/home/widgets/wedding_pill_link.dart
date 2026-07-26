import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class WeddingPillLink extends StatelessWidget {
  const WeddingPillLink({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.sageDark,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.1,
        ),
      ),
      child: Text(label.toUpperCase()),
    );
  }
}
