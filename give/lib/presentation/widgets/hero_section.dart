import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/store/hero_store.dart';
import '../../data/models/hero_card_model.dart';

class HeroSectionWidget extends ConsumerStatefulWidget {
  const HeroSectionWidget({super.key});

  @override
  ConsumerState<HeroSectionWidget> createState() => _HeroSectionWidgetState();
}

class _HeroSectionWidgetState extends ConsumerState<HeroSectionWidget> {
  late PageController _pageController;
  Timer? _timer;

  // Set a large starting page so the user can swipe backward immediately if desired
  static const int _initialPage = 10000;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: 1.0,
    );
    _startAutoScroll(); // moved into its own method — see note below
  }

  void _startAutoScroll() {
    _timer
        ?.cancel(); // FIX 1: cancel any existing timer before starting a new one,
    // prevents multiple timers stacking if this ever runs twice
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heroCards = ref.watch(heroCardsProvider);
    final primaryColor = Theme.of(context).colorScheme.primary;

    if (heroCards.isEmpty) {
      return const SizedBox(height: 220);
    }

    return SizedBox(
      height: 220,
      width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        // Omit itemCount so PageView can slide infinitely in both directions
        itemBuilder: (context, index) {
          // Use modulo operator to loop over actual card models
          final actualIndex = index % heroCards.length;
          final cardData = heroCards[actualIndex];

          return _buildHeroCard(context, cardData, primaryColor);
        },
      ),
    );
  }

  Widget _buildHeroCard(
    BuildContext context,
    HeroCardModel card,
    Color primaryColor,
  ) {
    return Stack(
      children: [
        // 1. Background Image (Full Width)
        Positioned.fill(
          child: Image.network(
            card.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey.shade300),
          ),
        ),

        // 2. Dark Gradient Overlay
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

        // 3. Title & Action Button
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                card.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                onPressed: () {
                  // Action when tapping hero button
                },
                child: Text(
                  card.btnText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
