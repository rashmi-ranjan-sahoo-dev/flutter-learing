import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/store/blog_store.dart';

class BlogDetailsScreen extends ConsumerWidget {
  const BlogDetailsScreen({super.key, required this.blogId});

  final String blogId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blog = ref.watch(blogByIdProvider(blogId));

    if (blog == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Blog')),
        body: const Center(child: Text('This blog is no longer available.')),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Details')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 840),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        blog.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => ColoredBox(
                          color: colorScheme.primaryContainer,
                          child: Icon(Icons.volunteer_activism, color: colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Text('By ${blog.author}', style: TextStyle(color: colorScheme.onSurfaceVariant)),
                      Text(
                        blog.category,
                        style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold),
                      ),
                      Text(blog.publishedAt, style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    blog.title,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  const SizedBox(height: 16),
                  Text(blog.content, style: const TextStyle(fontSize: 16, height: 1.6)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
