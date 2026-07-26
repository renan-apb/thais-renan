import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/content/wedding_content.dart';
import '../../../core/theme/app_colors.dart';
import 'wedding_buttons.dart';
import 'wedding_pill_link.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onNavTap,
    required this.onConfirmPresence,
    required this.onViewDetails,
  });

  final void Function(String sectionKey) onNavTap;
  final VoidCallback onConfirmPresence;
  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned(
          top: -70,
          left: -70,
          child: _HeroBlob(
            size: 260,
            color: AppColors.heroBlobLeft,
          ),
        ),
        const Positioned(
          top: 10,
          right: -110,
          child: _HeroBlob(
            size: 320,
            color: AppColors.heroBlobRight,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xF2FFFFFF),
                Color(0xE6FFF8FA),
              ],
            ),
            border: Border.all(color: const Color(0xE6F0D8DE)),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 50,
                offset: Offset(0, 18),
              ),
            ],
          ),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final item in WeddingContent.navItems)
                    WeddingPillLink(
                      label: item.label,
                      onTap: () => onNavTap(item.sectionKey),
                    ),
                ],
              ),
              const SizedBox(height: 38),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const Text(
                      WeddingContent.eyebrow,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 4,
                        fontSize: 13.12,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      WeddingContent.brideName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _heroNameSize(context),
                        height: 0.95,
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                    ),
                    const Text(
                      '&',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 41.6,
                        height: 1.2,
                        fontStyle: FontStyle.italic,
                        color: AppColors.ampersand,
                      ),
                    ),
                    Text(
                      WeddingContent.groomName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _heroNameSize(context),
                        height: 0.95,
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                    ),
                    const SizedBox(height: 22),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Text(
                        WeddingContent.heroSubtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 17.28,
                            ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFFFF8FA), Color(0xFFFFF1F4)],
                        ),
                        border: Border.all(color: AppColors.line),
                      ),
                      child: const Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        runSpacing: 8,
                        children: [
                          Text(
                            WeddingContent.eventDateLabel,
                            style: TextStyle(
                              color: AppColors.highlightText,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '•',
                            style: TextStyle(color: AppColors.highlightText),
                          ),
                          Text(
                            WeddingContent.eventLocationLabel,
                            style: TextStyle(
                              color: AppColors.highlightText,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 14,
                      runSpacing: 14,
                      children: [
                        WeddingPrimaryButton(
                          label: WeddingContent.confirmPresenceLabel,
                          onPressed: onConfirmPresence,
                        ),
                        WeddingSecondaryButton(
                          label: WeddingContent.viewDetailsLabel,
                          onPressed: onViewDetails,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double _heroNameSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 900) return 86.4;
    if (width >= 600) return 64;
    return 48;
  }
}

class _HeroBlob extends StatelessWidget {
  const _HeroBlob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
