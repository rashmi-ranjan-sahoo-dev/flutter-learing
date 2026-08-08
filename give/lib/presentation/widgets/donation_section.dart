import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquee_text/marquee_text.dart';
import '../riverpod/store/donation_store.dart';

class DonationWidget extends ConsumerWidget {
  const DonationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donations = ref.watch(donationProvider);

    if (donations.isEmpty) {
      return const SizedBox.shrink();
    }

    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondColor = Theme.of(context).colorScheme.error;

    final nameStyle = TextStyle(
      fontSize: 15,
      color: primaryColor,
      fontWeight: FontWeight.w600,
    );
    final moneyStyle = TextStyle(
      fontSize: 15,
      color: secondColor,
      fontWeight: FontWeight.bold,
    );
    const separator = TextSpan(text: '     ❄     ');

    final spans = <InlineSpan>[];

    for (final e in donations) {
      spans.add(TextSpan(text: e.donorName, style: nameStyle));
      spans.add(TextSpan(text: ' just donated ', style: nameStyle));
      spans.add(TextSpan(text: e.amount.toString(), style: moneyStyle));
      spans.add(separator);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: const Color(0xFFFAF5F5),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: MarqueeText(
            text: TextSpan(children: spans),
            style: nameStyle,
            speed: MediaQuery.of(context).size.width > 600 ? 35 : 25,
          ),
        ),
      ),
    );
  }
}
