import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/ngo_mode.dart';
import '../riverpod/store/ngo_store.dart';

class NgoSectionWidget extends ConsumerStatefulWidget {
  const NgoSectionWidget({super.key});

  @override
  ConsumerState<NgoSectionWidget> createState() => _NgoSectionWidgetState();
}

class _NgoSectionWidgetState extends ConsumerState<NgoSectionWidget> {
  static const _initialPage = 10000;
  static const _autoScrollInterval = Duration(seconds: 2);
  static const _pageAnimationDuration = Duration(milliseconds: 350);

  late PageController _pageController;
  Timer? _autoScrollTimer;
  double _viewportFraction = 1;
  int _currentPage = _initialPage;
  bool _isUserDragging = false;
  bool _viewportUpdateScheduled = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: _viewportFraction,
    );
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(_autoScrollInterval, (_) {
      if (_isUserDragging || !_pageController.hasClients) return;

      final nextPage = (_pageController.page ?? _currentPage).round() + 1;
      _pageController.animateToPage(
        nextPage,
        duration: _pageAnimationDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  void _updateViewportFraction(double fraction) {
    if (_viewportFraction == fraction || _viewportUpdateScheduled) return;

    _viewportUpdateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final currentPage = (_pageController.page ?? _currentPage).round();
      final previousController = _pageController;
      setState(() {
        _viewportFraction = fraction;
        _pageController = PageController(
          initialPage: currentPage,
          viewportFraction: _viewportFraction,
        );
        _viewportUpdateScheduled = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        previousController.dispose();
      });
    });
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification && notification.dragDetails != null) {
      _isUserDragging = true;
      _autoScrollTimer?.cancel();
    } else if (notification is ScrollEndNotification && _isUserDragging) {
      _isUserDragging = false;
      _startAutoScroll();
    }
    return false;
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ngos = ref.watch(ngoProvider);
    if (ngos.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.sizeOf(context).width;
        final cardsPerView = screenWidth >= 1024
            ? 4
            : screenWidth >= 840
            ? 3
            : screenWidth >= 600
            ? 2
            : 1;
        final viewportFraction = 1 / cardsPerView;
        final isMobile = cardsPerView == 1;
        const cardGap = 12.0;
        final pageWidth = constraints.maxWidth * viewportFraction;
        final cardWidth =
            (pageWidth - cardGap).clamp(0.0, double.infinity).toDouble();
        final cardHeight = cardWidth / 0.9;

        _updateViewportFraction(viewportFraction);

        return Padding(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 24),
          child: Semantics(
            label: 'Trusted NGOs carousel',
            child: Column(
              children: [
                Text(
                  'Trusted by NGOs',
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: cardHeight,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _handleScrollNotification,
                    child: PageView.builder(
                      controller: _pageController,
                      padEnds: false,
                      onPageChanged: (page) => setState(() => _currentPage = page),
                      itemBuilder: (context, page) {
                        final ngo = ngos[page % ngos.length];
                        return Padding(
                          padding: const EdgeInsets.only(right: cardGap),
                          child: NgoCard(ngo: ngo, isMobile: isMobile),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NgoCard extends StatelessWidget {
  final NgoModel ngo;
  final bool isMobile;

  const NgoCard({super.key, required this.ngo, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: ngo.name,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              ngo.logo,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => ColoredBox(color: Colors.grey.shade300),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.75)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: isMobile ? 12 : 10,
              left: isMobile ? 12 : 10,
              right: isMobile ? 12 : 10,
              child: Text(
                ngo.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 15 : 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
