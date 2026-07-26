import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class WeddingPrimaryButton extends StatelessWidget {
  const WeddingPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _WeddingButton(
      label: label,
      onPressed: onPressed,
      background: AppColors.roseDark,
      foreground: AppColors.white,
      border: AppColors.roseDark,
    );
  }
}

class WeddingSecondaryButton extends StatelessWidget {
  const WeddingSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _WeddingButton(
      label: label,
      onPressed: onPressed,
      background: Colors.transparent,
      foreground: AppColors.roseDark,
      border: AppColors.rose,
    );
  }
}

class _WeddingButton extends StatelessWidget {
  const _WeddingButton({
    required this.label,
    required this.onPressed,
    required this.background,
    required this.foreground,
    required this.border,
  });

  final String label;
  final VoidCallback onPressed;
  final Color background;
  final Color foreground;
  final Color border;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 52),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        foregroundColor: foreground,
        backgroundColor: background,
        side: BorderSide(color: border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: Text(label.toUpperCase()),
    );
  }
}
