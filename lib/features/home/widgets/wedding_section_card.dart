import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class WeddingSectionCard extends StatelessWidget {
  const WeddingSectionCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 44, vertical: 52),
    this.gradient,
    this.backgroundColor = AppColors.paper,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? backgroundColor : null,
        border: Border.all(color: AppColors.line),
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
    this.centered = false,
  });

  final String title;
  final String body;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          '✦',
          style: TextStyle(
            color: AppColors.terracotta.withValues(alpha: .8),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: 'Great Vibes',
                fontSize: MediaQuery.sizeOf(context).width < 600 ? 42 : 54,
                color: AppColors.roseDark,
              ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            body,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
