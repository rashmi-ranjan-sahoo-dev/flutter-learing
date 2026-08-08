import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/partner_testimonial_model.dart';

final List<PartnerTestimonialModel> partnerTestimonialList = [
  const PartnerTestimonialModel(
    name: 'Kavita Sharma',
    organization: 'Smile Foundation',
    avatarUrl: 'https://i.pravatar.cc/150?img=47',
    rating: 5,
    message:
        'Give makes it simple for us to connect generous donors with the communities that need support the most.',
  ),
  const PartnerTestimonialModel(
    name: 'Amit Verma',
    organization: 'CRY',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
    rating: 5,
    message:
        'The platform is dependable, thoughtful, and helps our campaigns reach more people with confidence.',
  ),
  const PartnerTestimonialModel(
    name: 'Meera Iyer',
    organization: 'Akshaya Patra',
    avatarUrl: 'https://i.pravatar.cc/150?img=44',
    rating: 5,
    message:
        'A clear giving experience means more people can focus on the impact they want to create.',
  ),
  const PartnerTestimonialModel(
    name: 'Rohan Nair',
    organization: 'WWF India',
    avatarUrl: 'https://i.pravatar.cc/150?img=68',
    rating: 5,
    message:
        'Our partnership with Give helps supporters take meaningful action for people and the planet.',
  ),
];

final partnerTestimonialsProvider = Provider<List<PartnerTestimonialModel>>(
  (ref) => partnerTestimonialList,
);
