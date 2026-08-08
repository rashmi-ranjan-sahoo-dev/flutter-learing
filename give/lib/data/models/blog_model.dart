class BlogModel {
  const BlogModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.category,
    required this.publishedAt,
    required this.imageUrl,
    this.author = 'Team Give',
  });

  final String id;
  final String title;
  final String excerpt;
  final String content;
  final String category;
  final String publishedAt;
  final String imageUrl;
  final String author;
}
