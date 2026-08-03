import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/store/hero_store.dart';

class HeroSectionWidget extends ConsumerWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read list from Riverpod store
    final heroCards = ref.watch(heroCardsProvider);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: 220, // Height of the Hero Section
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9), // Leaves a peak of the next card
        itemCount: heroCards.length,
        itemBuilder: (context, index) {
          final cardData = heroCards[index];
          return _buildHeroCard(context, cardData, primaryColor);
        },
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context, HeroCardModel card, Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Stack(
          children: [
            // 1. Background Image
            Positioned.fill(
              child: Image.network(
                card.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey.shade300),
              ),
            ),

            // 2. Dark Gradient Overlay for Legibility
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.2),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),

            // 3. Title, Subtitle, and Action Button
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAlignment: CrossAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    card.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    card.subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onPressed: () {
                      // Action when tapping hero button
                    },
                    child: Text(
                      card.buttonText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}