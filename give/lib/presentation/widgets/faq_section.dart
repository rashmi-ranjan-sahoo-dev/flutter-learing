import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/faq_model.dart';
import '../riverpod/store/faq_store.dart';

class FaqSection extends ConsumerWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqs = ref.watch(faqItemsProvider);
    if (faqs.isEmpty) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isWide ? 36 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: isWide ? 30 : 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Everything you need to know about giving, impact, and community partnerships.',
                  style: TextStyle(
                    fontSize: isWide ? 17 : 15,
                    height: 1.5,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: faqs.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final faq = faqs[index];
              return _FaqItemTile(faq: faq);
            },
          ),
        ],
      ),
    );
  }
}

class _FaqItemTile extends ConsumerWidget {
  const _FaqItemTile({required this.faq});

  final FaqItem faq;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isExpanded = ref.watch(faqExpandedProvider) == faq.id;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        splashColor: colorScheme.primaryContainer.withAlpha(
          (0.22 * 255).round(),
        ),
        onTap: () {
          final currentExpanded = ref.read(faqExpandedProvider);
          ref.read(faqExpandedProvider.notifier).state =
              currentExpanded == faq.id ? null : faq.id;
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: colorScheme.outlineVariant.withAlpha((0.8 * 255).round()),
            ),
            color: isExpanded
                ? colorScheme.primaryContainer.withAlpha((0.28 * 255).round())
                : colorScheme.surface,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      faq.question,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 220),
                    child: Icon(Icons.add, color: colorScheme.primary),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: isExpanded
                      ? Padding(
                          key: ValueKey('answer-${faq.id}'),
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            faq.answer,
                            style: TextStyle(
                              fontSize: 14.5,
                              height: 1.6,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        )
                      : SizedBox.shrink(key: ValueKey('empty-${faq.id}')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
