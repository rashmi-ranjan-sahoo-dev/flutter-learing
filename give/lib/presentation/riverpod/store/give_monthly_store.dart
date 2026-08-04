import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/give_monthly_model.dart';

final List<GiveMonthlyModel> mockGiveMonthly = [
  GiveMonthlyModel(
    id: '1',
    title: 'No Child Orphaned',
    tag: 'Mission',
    badge: 'Tax Benefits Available',
    description: 'Support a child who has no one else in the world - ',
    highlight: 'donate now!',
    imageUrl:
        'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?q=80&w=600',
  ),
  GiveMonthlyModel(
    id: '2',
    title: 'Feed the Hungry',
    tag: 'Mission',
    badge: 'Tax Benefits Available',
    description: 'Provide nutritious meals to hungry families everyday - ',
    highlight: 'donate now!',
    imageUrl:
        'https://images.unsplash.com/photo-1593113598332-cd288d649433?q=80&w=600',
  ),
  GiveMonthlyModel(
    id: '3',
    title: 'Educate a Child',
    tag: 'Mission',
    badge: 'Tax Benefits Available',
    description:
        'Help underprivileged children get access to quality education - ',
    highlight: 'donate now!',
    imageUrl:
        'https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=600',
  ),
  // GiveMonthlyModel(
  //   id: '4',
  //   title: 'No Child Orphaned',
  //   tag: 'Mission',
  //   badge: 'Tax Benefits Available',
  //   description: 'Support a child who has no one else in the world - ',
  //   highlight: 'donate now!',
  //   imageUrl:
  //       'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?q=80&w=600',
  // ),
  // GiveMonthlyModel(
  //   id: '5',
  //   title: 'Feed the Hungry',
  //   tag: 'Mission',
  //   badge: 'Tax Benefits Available',
  //   description: 'Provide nutritious meals to hungry families everyday - ',
  //   highlight: 'donate now!',
  //   imageUrl:
  //       'https://images.unsplash.com/photo-1593113598332-cd288d649433?q=80&w=600',
  // ),
  // GiveMonthlyModel(
  //   id: '6',
  //   title: 'Educate a Child',
  //   tag: 'Mission',
  //   badge: 'Tax Benefits Available',
  //   description:
  //       'Help underprivileged children get access to quality education - ',
  //   highlight: 'donate now!',
  //   imageUrl:
  //       'https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=600',
  // ),
];

final giveMonthlyProvider = Provider<List<GiveMonthlyModel>>((ref) {
    return mockGiveMonthly;
});
