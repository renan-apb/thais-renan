import 'package:flutter/material.dart';

import '../../../core/content/wedding_content.dart';
import '../../../core/theme/app_colors.dart';
import 'wedding_pill_link.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onNavTap,
  });

  final void Function(String sectionKey) onNavTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.paper,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 6,
              runSpacing: 2,
              children: [
                for (final item in WeddingContent.navItems)
                  WeddingPillLink(
                    label: item.label,
                    onTap: () => onNavTap(item.sectionKey),
                  ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.line),
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 620;
              return Container(
                constraints: BoxConstraints(
                  minHeight: compact ? 760 : 820,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.blushSoft,
                      AppColors.paper,
                      AppColors.paper,
                    ],
                    stops: [0, .38, 1],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: compact ? -18 : -32,
                      left: compact ? -70 : 0,
                      right: compact ? -70 : 0,
                      height: compact ? 240 : 300,
                      child: _FloralBand(compact: compact),
                    ),
                    Positioned(
                      bottom: compact ? -45 : -68,
                      left: compact ? -80 : 0,
                      right: compact ? -80 : 0,
                      height: compact ? 245 : 310,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: _FloralBand(compact: compact),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        compact ? 24 : 56,
                        compact ? 188 : 230,
                        compact ? 24 : 56,
                        compact ? 178 : 210,
                      ),
                      child: _HeroContent(
                        compact: compact,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({
    required this.compact,
  });

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          WeddingContent.brideName,
          textAlign: TextAlign.center,
          style: _nameStyle(compact),
        ),
        Text(
          '&',
          style: TextStyle(
            color: AppColors.sage,
            fontFamily: 'Cormorant Garamond',
            fontSize: compact ? 34 : 42,
            height: .8,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          WeddingContent.groomName,
          textAlign: TextAlign.center,
          style: _nameStyle(compact),
        ),
        SizedBox(height: compact ? 22 : 28),
        const _DateDivider(),
        const SizedBox(height: 18),
        const Text(
          '${WeddingContent.eventDateLabel}\n${WeddingContent.eventLocationLabel}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.heading,
            fontFamily: 'Cormorant Garamond',
            fontSize: 18,
            height: 1.45,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.6,
          ),
        ),
      ],
    );
  }

  TextStyle _nameStyle(bool compact) {
    return TextStyle(
      color: AppColors.heading,
      fontFamily: 'Great Vibes',
      fontSize: compact ? 67 : 94,
      height: .95,
      fontWeight: FontWeight.w400,
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 235,
      child: Row(
        children: [
          Expanded(child: Divider(color: AppColors.rose, thickness: .8)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.favorite,
              color: AppColors.sage,
              size: 13,
            ),
          ),
          Expanded(child: Divider(color: AppColors.rose, thickness: .8)),
        ],
      ),
    );
  }
}

class _FloralGarland extends StatelessWidget {
  const _FloralGarland({
    this.fadeEdges = false,
    this.alignment = Alignment.center,
    this.fadeDirection,
  });

  final bool fadeEdges;
  final Alignment alignment;
  final _FadeDirection? fadeDirection;

  @override
  Widget build(BuildContext context) {
    final image = Semantics(
      label: 'Arranjo floral em aquarela',
      image: true,
      child: Image.asset(
        'assets/images/wedding_floral_garland.png',
        fit: BoxFit.cover,
        alignment: alignment,
        filterQuality: FilterQuality.high,
      ),
    );

    if (!fadeEdges && fadeDirection == null) return image;

    final colors = switch (fadeDirection) {
      _FadeDirection.left => const [
          Colors.transparent,
          Colors.white,
          Colors.white,
        ],
      _FadeDirection.right => const [
          Colors.white,
          Colors.white,
          Colors.transparent,
        ],
      null => const [
          Colors.transparent,
          Colors.white,
          Colors.white,
          Colors.transparent,
        ],
    };

    final stops = switch (fadeDirection) {
      _FadeDirection.left => const [0.0, .3, 1.0],
      _FadeDirection.right => const [0.0, .7, 1.0],
      null => const [0.0, .09, .91, 1.0],
    };

    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        stops: stops,
      ).createShader(bounds),
      child: image,
    );
  }
}

class _FloralBand extends StatelessWidget {
  const _FloralBand({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return const _FloralGarland();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final sideWidth = constraints.maxWidth * .46;
        final centerWidth = constraints.maxWidth * .34;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: sideWidth,
              child: const _FloralGarland(
                alignment: Alignment.centerLeft,
                fadeDirection: _FadeDirection.right,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: sideWidth,
              child: const _FloralGarland(
                alignment: Alignment.centerRight,
                fadeDirection: _FadeDirection.left,
              ),
            ),
            Positioned(
              left: (constraints.maxWidth - centerWidth) / 2,
              top: 32,
              bottom: 22,
              width: centerWidth,
              child: Opacity(
                opacity: .46,
                child: const _FloralGarland(
                  fadeEdges: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

enum _FadeDirection { left, right }
