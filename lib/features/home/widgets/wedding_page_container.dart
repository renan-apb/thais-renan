import 'package:flutter/material.dart';

class WeddingPageContainer extends StatelessWidget {
  const WeddingPageContainer({super.key, required this.child});

  final Widget child;

  static const maxWidth = 1800.0;
  static const horizontalPadding = 0.0;
  static const breakpoint = 820.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: child,
        ),
      ),
    );
  }
}
