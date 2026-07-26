import 'package:flutter/material.dart';

/// Matches legacy `.container`: min(1100px, calc(100% - 32px)).
class WeddingPageContainer extends StatelessWidget {
  const WeddingPageContainer({super.key, required this.child});

  final Widget child;

  static const maxWidth = 1100.0;
  static const horizontalPadding = 16.0;
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
