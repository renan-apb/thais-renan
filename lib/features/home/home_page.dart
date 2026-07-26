import 'package:flutter/material.dart';

import '../../core/content/wedding_content.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/launch_url.dart';
import 'widgets/hero_section.dart';
import 'widgets/wedding_buttons.dart';
import 'widgets/wedding_info_card.dart';
import 'widgets/wedding_page_container.dart';
import 'widgets/wedding_section_card.dart' show WeddingSectionIntro;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _sectionKeys = <String, GlobalKey>{
    for (final item in WeddingContent.navItems) item.sectionKey: GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToSection(String sectionKey) async {
    final context = _sectionKeys[sectionKey]?.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.03,
    );
  }

  Future<void> _openWhatsApp() =>
      launchExternalUrl(WeddingContent.whatsappUrl);

  Future<void> _openMaps() => launchExternalUrl(WeddingContent.mapsUrl);

  Widget _sectionAnchor(String key, Widget child) =>
      KeyedSubtree(key: _sectionKeys[key], child: child);

  EdgeInsets _sectionPadding(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600
        ? const EdgeInsets.symmetric(horizontal: 24, vertical: 44)
        : const EdgeInsets.symmetric(horizontal: 64, vertical: 72);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: WeddingPageContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeroSection(
                onNavTap: _scrollToSection,
              ),
              _sectionAnchor(
                'historia',
                _FloralSection(
                  padding: _sectionPadding(context),
                  tint: AppColors.blushSoft,
                  floralAlignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      const Text(
                        'NOSSA HISTÓRIA',
                        style: TextStyle(
                          color: AppColors.roseDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                        ),
                      ),
                      const SizedBox(height: 25),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 790),
                        child: Text(
                          WeddingContent.historyQuote,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.heading,
                                fontSize:
                                    MediaQuery.sizeOf(context).width < 600
                                        ? 28
                                        : 38,
                                height: 1.45,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Text(
                        WeddingContent.historyNote,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.muted,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              _FloralSection(
                padding: _sectionPadding(context),
                tint: AppColors.paper,
                floralAlignment: Alignment.centerLeft,
                child: WeddingSectionIntro(
                  title: WeddingContent.welcome.title,
                  body: WeddingContent.welcome.body,
                  centered: true,
                ),
              ),
              _sectionAnchor(
                'detalhes',
                _FloralSection(
                  padding: _sectionPadding(context),
                  tint: AppColors.blushSoft,
                  floralAlignment: Alignment.topRight,
                  child: Column(
                    children: [
                      WeddingSectionIntro(
                        title: WeddingContent.details.title,
                        body: WeddingContent.details.body,
                        centered: true,
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          const gap = 20.0;
                          if (constraints.maxWidth <
                              WeddingPageContainer.breakpoint) {
                            return const Column(
                              children: [
                                WeddingInfoCard(
                                  block: WeddingContent.ceremony,
                                ),
                                SizedBox(height: gap),
                                WeddingInfoCard(
                                  block: WeddingContent.reception,
                                ),
                              ],
                            );
                          }
                          return const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: WeddingInfoCard(
                                  block: WeddingContent.ceremony,
                                ),
                              ),
                              SizedBox(width: gap),
                              Expanded(
                                child: WeddingInfoCard(
                                  block: WeddingContent.reception,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              _sectionAnchor(
                'presenca',
                _ActionSection(
                  color: AppColors.paper,
                  intro: WeddingContent.rsvp,
                  button: WeddingPrimaryButton(
                    label: WeddingContent.confirmWhatsAppLabel,
                    onPressed: _openWhatsApp,
                  ),
                  padding: _sectionPadding(context),
                ),
              ),
              _sectionAnchor(
                'presentes',
                _FloralSection(
                  padding: _sectionPadding(context),
                  tint: AppColors.giftBg,
                  floralAlignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      WeddingSectionIntro(
                        title: WeddingContent.gifts.title,
                        body: WeddingContent.gifts.body,
                        centered: true,
                      ),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 720),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.giftBorder),
                          borderRadius: BorderRadius.circular(22),
                          color: AppColors.paper.withValues(alpha: .68),
                        ),
                        child: Text(
                          WeddingContent.giftsPlaceholder,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _ActionSection(
                color: AppColors.paper,
                intro: WeddingContent.directions,
                button: WeddingSecondaryButton(
                  label: WeddingContent.openMapLabel,
                  onPressed: _openMaps,
                ),
                padding: _sectionPadding(context),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.blushSoft, AppColors.blush],
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      '${WeddingContent.brideName} & ${WeddingContent.groomName}',
                      style: TextStyle(
                        color: AppColors.roseDark,
                        fontFamily: 'Great Vibes',
                        fontSize: 38,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      WeddingContent.footerText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.heading,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionSection extends StatelessWidget {
  const _ActionSection({
    required this.color,
    required this.intro,
    required this.button,
    required this.padding,
  });

  final Color color;
  final WeddingSectionCopy intro;
  final Widget button;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return _FloralSection(
      padding: padding,
      tint: color,
      floralAlignment: Alignment.centerRight,
      child: Column(
        children: [
          WeddingSectionIntro(
            title: intro.title,
            body: intro.body,
            centered: true,
          ),
          button,
        ],
      ),
    );
  }
}

class _FloralSection extends StatelessWidget {
  const _FloralSection({
    required this.child,
    required this.padding,
    required this.tint,
    required this.floralAlignment,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color tint;
  final Alignment floralAlignment;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 600;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.lerp(AppColors.paper, tint, .42)!,
            tint,
            Color.lerp(tint, AppColors.paper, .38)!,
          ],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Align(
                alignment: floralAlignment,
                child: Opacity(
                  opacity: compact ? .10 : .16,
                  child: SizedBox(
                    width: compact ? 260 : 480,
                    child: Image.asset(
                      'assets/images/wedding_floral_garland.png',
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: padding,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1120),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
