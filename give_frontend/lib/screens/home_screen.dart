import 'package:flutter/material.dart';

import '../data/mock_campaigns.dart';
import '../widgets/campaign_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          children: [
            const _Header(),
            const SizedBox(height: 22),
            const _HeroSection(),
            const SizedBox(height: 30),
            const _SectionTitle(title: 'Give to a cause', action: 'See all'),
            const SizedBox(height: 14),
            const _CauseCategories(),
            const SizedBox(height: 30),
            const _SectionTitle(
                title: 'Popular fundraisers', action: 'View all'),
            const SizedBox(height: 14),
            ...mockCampaigns
                .map((campaign) => CampaignCard(campaign: campaign)),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.favorite, color: Color(0xFFE85D5D), size: 29),
        const SizedBox(width: 8),
        Text(
          'Give',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
          tooltip: 'Notifications',
        ),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?auto=format&fit=crop&w=900&q=80',
            fit: BoxFit.cover,
            errorBuilder: (_,_,_) => const ColoredBox(
              color: Color(0xFF176B5B),
            ),
          ),
          const ColoredBox(color: Color(0x880A3B31)),
          const Padding(
            padding: EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your kindness can\nchange a life.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    height: 1.08,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Explore verified causes that need you today.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.action});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        const Spacer(),
        Text(
          action,
          style: const TextStyle(
            color: Color(0xFF176B5B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _CauseCategories extends StatelessWidget {
  const _CauseCategories();

  @override
  Widget build(BuildContext context) {
    const categories = [
      (Icons.school_outlined, 'Children', Color(0xFFEAF5FF)),
      (Icons.health_and_safety_outlined, 'Health', Color(0xFFFFEDEC)),
      (Icons.pets_outlined, 'Animals', Color(0xFFFFF4D8)),
      (Icons.elderly_outlined, 'Elderly', Color(0xFFECE9FF)),
    ];

    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final category = categories[index];
          return Container(
            width: 88,
            decoration: BoxDecoration(
              color: category.$3,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category.$1, color: const Color(0xFF176B5B)),
                const SizedBox(height: 8),
                Text(
                  category.$2,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
