import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/fundraise_model.dart';
import '../riverpod/store/fundraise_store.dart';

class FundraiserSection extends ConsumerWidget {
  const FundraiserSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundraisers = ref.watch(fundraiseProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final useTwoColumns = width >= 800;
        final horizontalPadding = isMobile ? 0.0 : 8.0;
        const gap = 16.0;
        final cardWidth = useTwoColumns ? (width - (horizontalPadding * 2) - gap) / 2 : width - (horizontalPadding * 2);

        return Padding(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 24, horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Support a Fundraiser',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 22 : 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final fundraiser in fundraisers)
                    SizedBox(width: cardWidth, child: FundraiserCard(fundraiser: fundraiser)),
                ],
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('See More >', style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FundraiserCard extends StatelessWidget {
  final FundraiserModel fundraiser;

  const FundraiserCard({super.key, required this.fundraiser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(fundraiser.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fundraiser.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('By ${fundraiser.organizer}', maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 6,
                  children: [
                    Text('${fundraiser.donations} Donations'),
                    Text('${fundraiser.daysLeft} Days Left'),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: fundraiser.progress),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 6,
                  children: [
                    Text('₹${fundraiser.raisedAmount.toInt()} raised'),
                    Text('Goal ₹${fundraiser.goalAmount.toInt()}'),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Donate Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
