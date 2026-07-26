import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class WeddingSectionCard extends StatelessWidget {
  const WeddingSectionCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(30),
    this.gradient,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? AppColors.surface : null,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xE6F0D8DE)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 50,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: child,
    );
  }
}

class WeddingSectionIntro extends StatelessWidget {
  const WeddingSectionIntro({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            body,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 22),
      ],
    );
  }
}
