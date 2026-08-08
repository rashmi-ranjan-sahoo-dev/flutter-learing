class PartnerTestimonialModel {
  const PartnerTestimonialModel({
    required this.name,
    required this.organization,
    required this.avatarUrl,
    required this.message,
    required this.rating,
  });

  final String name;
  final String organization;
  final String avatarUrl;
  final String message;
  final int rating;

  String get initials => name
      .split(' ')
      .where((part) => part.isNotEmpty)
      .take(2)
      .map((part) => part[0])
      .join();
}
