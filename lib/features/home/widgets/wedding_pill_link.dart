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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: const Color(0xB8FFFFFF),
            border: Border.all(color: AppColors.line),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 15.36,
            ),
          ),
        ),
      ),
    );
  }
}
