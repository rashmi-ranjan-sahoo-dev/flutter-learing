import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/store/blog_store.dart';
import '../screens/all_blogs_screen.dart';
import '../screens/blog_details_screen.dart';
import 'blog_card.dart';

class BlogSection extends ConsumerStatefulWidget {
  const BlogSection({super.key});

  @override
  ConsumerState<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends ConsumerState<BlogSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blogs = ref.watch(blogsProvider);
    if (blogs.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final cardsPerPage = constraints.maxWidth >= 600 ? 2 : 1;
        final pageCount = (blogs.length / cardsPerPage).ceil();
        const gap = 16.0;
        final introWidth = isDesktop ? constraints.maxWidth * 0.28 : constraints.maxWidth;
        final carouselWidth = isDesktop
            ? constraints.maxWidth - introWidth - 32
            : constraints.maxWidth;
        final cardWidth = (carouselWidth - (cardsPerPage - 1) * gap) / cardsPerPage;
        final cardHeight = (cardWidth * (9 / 16) + 135).clamp(290.0, 520.0).toDouble();

        final intro = _BlogIntro(
          centered: !isDesktop,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const AllBlogsScreen()),
          ),
        );
        final carousel = Column(
          children: [
            SizedBox(
              height: cardHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pageCount,
                onPageChanged: (page) => setState(() => _currentPage = page),
                itemBuilder: (context, page) {
                  final start = page * cardsPerPage;
                  return Row(
                    children: List.generate(cardsPerPage, (index) {
                      final blog = blogs[(start + index) % blogs.length];
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: index == cardsPerPage - 1 ? 0 : gap),
                          child: BlogCard(
                            blog: blog,
                            variant: BlogCardVariant.home,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => BlogDetailsScreen(blogId: blog.id),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageCount, (index) {
                final selected = index == _currentPage;
                return Semantics(
                  button: true,
                  label: 'Show blog page ${index + 1}',
                  selected: selected,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 280),
                      curve: Curves.easeInOut,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: selected ? 10 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: selected
                              ? Theme.of(context).colorScheme.error
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );

        return Padding(
          padding: EdgeInsets.only(top: isDesktop ? 48 : 28, bottom: 32),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: introWidth, child: intro),
                    const SizedBox(width: 32),
                    Expanded(child: carousel),
                  ],
                )
              : Column(
                  children: [
                    intro,
                    const SizedBox(height: 24),
                    carousel,
                  ],
                ),
        );
      },
    );
  }
}

class _BlogIntro extends StatelessWidget {
  const _BlogIntro({required this.centered, required this.onPressed});

  final bool centered;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textAlign = centered ? TextAlign.center : TextAlign.left;
    return Column(
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Blog', textAlign: textAlign, style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        Text(
          'Packed with information, initiatives and impact of the social sector',
          textAlign: textAlign,
          style: TextStyle(fontSize: 18, height: 1.45, color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 28),
        OutlinedButton(onPressed: onPressed, child: const Text('Learn More')),
      ],
    );
  }
}
