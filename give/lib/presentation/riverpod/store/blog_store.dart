import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/blog_model.dart';

final List<BlogModel> blogList = [
  const BlogModel(
    id: 'education-for-every-child',
    title: 'Education for every child starts with one opportunity',
    excerpt:
        'See how community-led learning spaces are helping children stay curious, confident, and in school.',
    content:
        'Every child deserves a place to learn and grow. Across India, local partners are creating safe learning spaces, supporting teachers, and helping families keep education within reach.\n\nYour support helps provide books, digital learning tools, nutritious meals, and mentoring that can change a child’s future. When communities lead the work, solutions are practical, trusted, and built to last.',
    category: 'Education',
    publishedAt: 'August 5, 2026',
    imageUrl: 'https://picsum.photos/id/10/600/400',
  ),
  const BlogModel(
    id: 'healthcare-close-to-home',
    title: 'Bringing essential healthcare closer to home',
    excerpt:
        'Mobile clinics and local health workers are helping families access timely, dignified care.',
    content:
        'Distance should never decide whether someone receives care. Through mobile clinics and trained community health workers, our partners are reaching families who would otherwise have to travel hours for a check-up.\n\nThese programmes focus on prevention, early diagnosis, and respectful follow-up care. Small interventions at the right time can protect both health and livelihoods.',
    category: 'Healthcare',
    publishedAt: 'July 28, 2026',
    imageUrl: 'https://picsum.photos/id/20/600/400',
  ),
  const BlogModel(
    id: 'women-building-livelihoods',
    title: 'Women building livelihoods, confidence, and stronger communities',
    excerpt:
        'Skills training and collective support are opening new paths to financial independence.',
    content:
        'When women have access to skills, markets, and support networks, the benefits extend far beyond an individual income. Families gain stability and communities become more resilient.\n\nPartner programmes combine practical training with mentorship and access to savings groups, so women can make informed choices about their futures.',
    category: 'Livelihoods',
    publishedAt: 'July 17, 2026',
    imageUrl: 'https://picsum.photos/id/30/600/400',
  ),
  const BlogModel(
    id: 'clean-water-collective-action',
    title: 'Clean water is a shared goal—and collective action gets us there',
    excerpt:
        'Discover how village water committees are protecting reliable sources for the long term.',
    content:
        'Reliable water changes daily life. It reduces time spent collecting water, improves health, and gives children more time to learn.\n\nCommunity water committees are maintaining local systems and helping households adopt safer practices. Their work shows that lasting access depends on local ownership as much as infrastructure.',
    category: 'Environment',
    publishedAt: 'July 4, 2026',
    imageUrl: 'https://picsum.photos/id/40/600/400',
  ),
  const BlogModel(
    id: 'nutrition-in-the-first-years',
    title: 'Why nutrition in the first years matters so much',
    excerpt:
        'Local nutrition programmes are giving parents practical support when it matters most.',
    content:
        'The first years of life shape lifelong health. Families need accurate information, affordable food options, and timely care to help young children thrive.\n\nCommunity nutrition sessions bring together caregivers, health workers, and local leaders to turn knowledge into everyday action.',
    category: 'Healthcare',
    publishedAt: 'June 21, 2026',
    imageUrl: 'https://picsum.photos/id/50/600/400',
  ),
  const BlogModel(
    id: 'safer-spaces-for-children',
    title: 'Creating safer spaces where children can be heard',
    excerpt:
        'Child protection begins with listening, trusted adults, and communities that act together.',
    content:
        'A safe childhood needs more than a promise. It needs adults who listen, clear pathways for support, and communities that know how to respond.\n\nOur partners work with children, parents, schools, and local institutions to create environments where every child is treated with care and respect.',
    category: 'Children',
    publishedAt: 'June 8, 2026',
    imageUrl: 'https://picsum.photos/id/60/600/400',
  ),
  const BlogModel(
    id: 'restoring-green-neighbourhoods',
    title: 'Restoring green neighbourhoods, one local project at a time',
    excerpt:
        'Young volunteers are helping restore shared spaces and build climate-ready communities.',
    content:
        'Environmental action is strongest when people can see and care for its impact nearby. From urban gardens to restored wetlands, local projects are giving volunteers a meaningful role in protecting shared resources.\n\nThese efforts make neighbourhoods healthier today while building habits that support a more resilient tomorrow.',
    category: 'Environment',
    publishedAt: 'May 26, 2026',
    imageUrl: 'https://picsum.photos/id/70/600/400',
  ),
  const BlogModel(
    id: 'the-power-of-regular-giving',
    title: 'The quiet power of regular giving',
    excerpt:
        'Consistent support helps partners plan ahead and stay alongside communities for longer.',
    content:
        'A single gift can start change; regular giving helps sustain it. Predictable support allows partners to plan programmes, retain skilled teams, and respond to needs before they become emergencies.\n\nWhatever the amount, a regular contribution becomes part of a community’s longer journey toward opportunity and dignity.',
    category: 'Giving',
    publishedAt: 'May 12, 2026',
    imageUrl: 'https://picsum.photos/id/80/600/400',
  ),
];

final blogsProvider = Provider<List<BlogModel>>((ref) => blogList);

final blogByIdProvider = Provider.family<BlogModel?, String>((ref, id) {
  for (final blog in ref.watch(blogsProvider)) {
    if (blog.id == id) return blog;
  }
  return null;
});
