import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../data/models/faq_model.dart';

final faqItemsProvider = Provider<List<FaqItem>>((ref) {
  return const [
    FaqItem(
      id: 'support',
      question: 'How can I support a cause?',
      answer:
          'You can make a one-time donation or become a monthly donor. Both options help sustain long-term impact and provide communities with reliable support.',
    ),
    FaqItem(
      id: 'impact',
      question: 'How do I know my donation is making an impact?',
      answer:
          'We share stories, progress updates, and transparent reports so you can see how your generosity is helping real people and communities.',
    ),
    FaqItem(
      id: 'fundraising',
      question: 'Can I organize a fundraiser for a specific cause?',
      answer:
          'Yes. Our team can guide you through setting up a fundraiser, sharing your story, and connecting your campaign to meaningful impact.',
    ),
    FaqItem(
      id: 'partnership',
      question: 'Do you work with local partners and communities?',
      answer:
          'Absolutely. We collaborate with trusted local organizations and community leaders to ensure support is relevant, respectful, and effective.',
    ),
  ];
});

final faqExpandedProvider = StateProvider<String?>((ref) => null);
