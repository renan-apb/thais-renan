import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/content/wedding_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/launch_url.dart';

class WeddingInfoCard extends StatelessWidget {
  const WeddingInfoCard({super.key, required this.block});

  final InfoBlock block;

  static String? _urlForLine(InfoLine line) {
    if (line.linkUrl != null && line.linkUrl!.isNotEmpty) return line.linkUrl;
    final value = line.value.trim();
    if (value.startsWith('http://') || value.startsWith('https://')) return value;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 34, 32, 28),
      decoration: BoxDecoration(
        color: AppColors.paper.withValues(alpha: .88),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.giftBorder),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 28,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(block.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 18),
          for (final line in block.lines) ...[
            _InfoLineRow(
              line: line,
              bodyStyle: bodyStyle,
              url: _urlForLine(line),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _InfoLineRow extends StatelessWidget {
  const _InfoLineRow({
    required this.line,
    required this.bodyStyle,
    required this.url,
  });

  final InfoLine line;
  final TextStyle? bodyStyle;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final label = TextSpan(
      text: '${line.label.toUpperCase()}\n',
      style: bodyStyle?.copyWith(
        color: AppColors.terracotta,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.1,
      ),
    );
    final valueStyle = bodyStyle?.copyWith(color: AppColors.text);

    return RichText(
      text: TextSpan(
        style: valueStyle,
        children: [
          label,
          TextSpan(
            text: line.value,
            style: url == null
                ? valueStyle
                : valueStyle?.copyWith(
                    color: AppColors.sageDark,
                    decoration: TextDecoration.underline,
                  ),
            recognizer: url == null
                ? null
                : (TapGestureRecognizer()
                  ..onTap = () => launchExternalUrl(url!)),
          ),
        ],
      ),
    );
  }
}
