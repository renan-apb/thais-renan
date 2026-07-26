import 'package:flutter/material.dart';

import '../../core/content/wedding_content.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/launch_url.dart';
import 'widgets/hero_section.dart';
import 'widgets/wedding_buttons.dart';
import 'widgets/wedding_info_card.dart';
import 'widgets/wedding_page_container.dart';
import 'widgets/wedding_section_card.dart';

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
    final key = _sectionKeys[sectionKey];
    final context = key?.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: 0.08,
    );
  }

  Future<void> _openWhatsApp() => launchExternalUrl(WeddingContent.whatsappUrl);

  Future<void> _openMaps() => launchExternalUrl(WeddingContent.mapsUrl);

  Widget _sectionAnchor({required String sectionKey, required Widget child}) {
    return KeyedSubtree(
      key: _sectionKeys[sectionKey],
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 1.4,
          colors: [
            Color(0xFFFFFEFE),
            Color(0xFFFFF6F7),
            Color(0xFFFFF1F4),
          ],
          stops: [0, 0.35, 1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: WeddingPageContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 28),
                HeroSection(
                  onNavTap: _scrollToSection,
                  onConfirmPresence: _openWhatsApp,
                  onViewDetails: () => _scrollToSection('detalhes'),
                ),
                const SizedBox(height: 22),
                _sectionAnchor(
                  sectionKey: 'historia',
                  child: WeddingSectionCard(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xDBFFFFFF),
                        Color(0xEBFFF6F8),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          WeddingContent.historyQuote,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 19.52,
                                fontStyle: FontStyle.italic,
                                color: AppColors.quote,
                                height: 1.6,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          WeddingContent.historyNote,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 15.2,
                                color: AppColors.smallNote,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                WeddingSectionCard(
                  child: WeddingSectionIntro(
                    title: WeddingContent.welcome.title,
                    body: WeddingContent.welcome.body,
                  ),
                ),
                const SizedBox(height: 22),
                _sectionAnchor(
                  sectionKey: 'detalhes',
                  child: WeddingSectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeddingSectionIntro(
                          title: WeddingContent.details.title,
                          body: WeddingContent.details.body,
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final narrow =
                                constraints.maxWidth < WeddingPageContainer.breakpoint;
                            const gap = 22.0;
                            if (narrow) {
                              return const Column(
                                children: [
                                  WeddingInfoCard(block: WeddingContent.ceremony),
                                  SizedBox(height: gap),
                                  WeddingInfoCard(block: WeddingContent.reception),
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
                const SizedBox(height: 22),
                _sectionAnchor(
                  sectionKey: 'presenca',
                  child: WeddingSectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeddingSectionIntro(
                          title: WeddingContent.rsvp.title,
                          body: WeddingContent.rsvp.body,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: WeddingPrimaryButton(
                            label: WeddingContent.confirmWhatsAppLabel,
                            onPressed: _openWhatsApp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                _sectionAnchor(
                  sectionKey: 'presentes',
                  child: WeddingSectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeddingSectionIntro(
                          title: WeddingContent.gifts.title,
                          body: WeddingContent.gifts.body,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.giftBg,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: AppColors.giftBorder),
                          ),
                          child: Text(
                            WeddingContent.giftsPlaceholder,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.giftPlaceholder,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                WeddingSectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeddingSectionIntro(
                        title: WeddingContent.directions.title,
                        body: WeddingContent.directions.body,
                      ),
                      WeddingSecondaryButton(
                        label: WeddingContent.openMapLabel,
                        onPressed: _openMaps,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    WeddingContent.footerText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.footer,
                          fontSize: 15.36,
                        ),
                  ),
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
