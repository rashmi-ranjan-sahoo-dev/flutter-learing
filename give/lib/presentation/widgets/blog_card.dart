import 'package:flutter/material.dart';

import '../../data/models/blog_model.dart';

enum BlogCardVariant { home, listing }

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
    required this.onTap,
    this.variant = BlogCardVariant.listing,
  });

  final BlogModel blog;
  final VoidCallback onTap;
  final BlogCardVariant variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isHomeCard = variant == BlogCardVariant.home;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: isHomeCard ? 4 : 1,
      shadowColor: Colors.black.withValues(alpha: isHomeCard ? 0.16 : 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isHomeCard ? 18 : 0),
      ),
      child: InkWell(
        onTap: onTap,
        child: isHomeCard
            ? _HomeBlogCardContent(blog: blog, colorScheme: colorScheme)
            : _ListingBlogCardContent(blog: blog, colorScheme: colorScheme),
      ),
    );
  }
}

class _HomeBlogCardContent extends StatelessWidget {
  const _HomeBlogCardContent({required this.blog, required this.colorScheme});

  final BlogModel blog;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: _BlogImage(blog: blog, colorScheme: colorScheme),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
                  ),
                ),
                Text(
                  blog.publishedAt,
                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ListingBlogCardContent extends StatelessWidget {
  const _ListingBlogCardContent({
    required this.blog,
    required this.colorScheme,
  });

  final BlogModel blog;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: _BlogImage(blog: blog, colorScheme: colorScheme),
          ),
          const SizedBox(height: 20),
          Text(
            blog.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person, size: 17),
                  const SizedBox(width: 4),
                  Text('By ${blog.author}'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.schedule, size: 17),
                  const SizedBox(width: 4),
                  Text(blog.publishedAt),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            blog.excerpt,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 16,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlogImage extends StatelessWidget {
  const _BlogImage({required this.blog, required this.colorScheme});

  final BlogModel blog;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      blog.imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        debugPrint(error.toString());
        return ColoredBox(
          color: colorScheme.primaryContainer,
          child: Icon(Icons.volunteer_activism, color: colorScheme.primary),
        );
      },
    );
  }
}
