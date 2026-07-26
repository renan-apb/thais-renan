import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/content/wedding_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/launch_url.dart';

class WeddingInfoCard extends StatelessWidget {
  const WeddingInfoCard({super.key, required this.block});

  final InfoBlock block;

  static String? _urlForLine(InfoLine line) {
    if (line.linkUrl != null && line.linkUrl!.isNotEmpty) {
      return line.linkUrl;
    }
    final value = line.value.trim();
    if (value.startsWith('http://') || value.startsWith('https://')) {
      return value;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceStrong,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            block.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 14),
          for (final line in block.lines) ...[
            _InfoLineRow(
              line: line,
              bodyStyle: bodyStyle,
              url: _urlForLine(line),
            ),
            const SizedBox(height: 10),
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
    final labelSpan = TextSpan(
      text: '${line.label}: ',
      style: bodyStyle?.copyWith(
        color: AppColors.text,
        fontWeight: FontWeight.w600,
      ),
    );

    if (url == null) {
      return RichText(
        text: TextSpan(
          style: bodyStyle,
          children: [labelSpan, TextSpan(text: line.value)],
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: bodyStyle,
        children: [
          labelSpan,
          TextSpan(
            text: line.value,
            style: bodyStyle?.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchExternalUrl(url!),
          ),
        ],
      ),
    );
  }
}
