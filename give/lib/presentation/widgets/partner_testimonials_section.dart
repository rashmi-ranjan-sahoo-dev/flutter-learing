import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/partner_testimonial_model.dart';
import '../riverpod/store/partner_testimonials_store.dart';

class PartnerTestimonialsSection extends ConsumerStatefulWidget {
  const PartnerTestimonialsSection({super.key});

  @override
  ConsumerState<PartnerTestimonialsSection> createState() =>
      _PartnerTestimonialsSectionState();
}

class _PartnerTestimonialsSectionState
    extends ConsumerState<PartnerTestimonialsSection> {
  static const _initialPage = 10000;
  static const _scrollDuration = Duration(milliseconds: 350);

  late PageController _pageController;
  double _viewportFraction = 1;
  int _currentPage = _initialPage;
  bool _viewportUpdateScheduled = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: _viewportFraction,
    );
  }

  void _goToPage(int page) {
    if (!_pageController.hasClients) return;
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: Curves.easeInOut,
    );
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final testimonials = ref.watch(partnerTestimonialsProvider);
    if (testimonials.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.sizeOf(context).width;
        final cardsPerView = screenWidth >= 1024
            ? 3
            : screenWidth >= 600
            ? 2
            : 1;
        final isMobile = cardsPerView == 1;
        final viewportFraction = 1 / cardsPerView;
        const cardGap = 16.0;
        final cardWidth = (constraints.maxWidth * viewportFraction - cardGap)
            .clamp(0.0, double.infinity)
            .toDouble();
        final cardHeight = (cardWidth * 0.78).clamp(280.0, 360.0).toDouble();

        _updateViewportFraction(viewportFraction);

        return Padding(
          padding: EdgeInsets.only(top: isMobile ? 24 : 32, bottom: 24),
          child: Semantics(
            label: 'What our partners say about us',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'What Our Partners Say About Us',
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                          style: TextStyle(
                            fontSize: isMobile ? 22 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (!isMobile) ...[
                        IconButton(
                          tooltip: 'Previous testimonials',
                          onPressed: () => _goToPage(
                            (_pageController.page ?? _currentPage).round() - 1,
                          ),
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                        IconButton(
                          tooltip: 'Next testimonials',
                          onPressed: () => _goToPage(
                            (_pageController.page ?? _currentPage).round() + 1,
                          ),
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: cardHeight,
                  child: PageView.builder(
                    controller: _pageController,
                    padEnds: false,
                    onPageChanged: (page) => _currentPage = page,
                    itemBuilder: (context, page) => Padding(
                      padding: const EdgeInsets.only(right: cardGap),
                      child: _TestimonialCard(
                        testimonial: testimonials[page % testimonials.length],
                      ),
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

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({required this.testimonial});

  final PartnerTestimonialModel testimonial;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 3,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.format_quote, size: 34, color: colorScheme.primary),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                testimonial.message,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, height: 1.45),
              ),
            ),
            Row(
              children: List.generate(
                testimonial.rating,
                (_) => Icon(
                  Icons.star_rounded,
                  size: 18,
                  color: Colors.amber.shade700,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    testimonial.avatarUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => CircleAvatar(
                      backgroundColor: colorScheme.primaryContainer,
                      foregroundColor: colorScheme.onPrimaryContainer,
                      child: Text(testimonial.initials),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        testimonial.organization,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
