import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/store/blog_store.dart';
import '../widgets/blog_card.dart';
import 'blog_details_screen.dart';

class AllBlogsScreen extends ConsumerWidget {
  const AllBlogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogs = ref.watch(blogsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Blog')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 1024
                ? 3
                : constraints.maxWidth >= 600
                ? 2
                : 1;
            final maxWidth = constraints.maxWidth > 1320 ? 1320.0 : constraints.maxWidth;
            const gap = 28.0;
            final cardWidth = (maxWidth - 32 - (columns - 1) * gap) / columns;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: [
                      for (final blog in blogs)
                        SizedBox(
                          width: cardWidth,
                          child: BlogCard(
                            blog: blog,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => BlogDetailsScreen(blogId: blog.id),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
