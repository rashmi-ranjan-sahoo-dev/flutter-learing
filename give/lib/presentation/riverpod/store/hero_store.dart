import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:give/data/models/hero_card_model.dart';
// import './hero_store.dart';

final List<HeroCardModel> mockHeroCards = [
  HeroCardModel(
    id: '1',
    title: 'Clean the Ocean Initiative',
    btnText: 'Donate Now',
    imageUrl:
        'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmdvfGVufDB8fDB8fHww',
  ),
  HeroCardModel(
    id: '2',
    title: 'Emergency Animal Rescue',
    btnText: 'Support Shelter',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyfw4V--Whja-cpwF0srDFqckA726H0-8Y-7SEvP4xPw&s=10',
  ),
  HeroCardModel(
    id: '3',
    title: 'Plant 1,000 Trees Today',
    btnText: 'Plant a Tree',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlNseW5lT8zKUSV0ToPOpwSzZAsmwSsygyA727POaFSA&s=10',
  ),
  HeroCardModel(
    id: '4',
    title: 'Clean the Ocean Initiative',
    btnText: 'Donate Now',
    imageUrl:
        'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmdvfGVufDB8fDB8fHww',
  ),
  HeroCardModel(
    id: '5',
    title: 'Emergency Animal Rescue',
    btnText: 'Support Shelter',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyfw4V--Whja-cpwF0srDFqckA726H0-8Y-7SEvP4xPw&s=10',
  ),
  HeroCardModel(
    id: '6',
    title: 'Plant 1,000 Trees Today',
    btnText: 'Plant a Tree',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlNseW5lT8zKUSV0ToPOpwSzZAsmwSsygyA727POaFSA&s=10',
  ),
];

final heroCardsProvider = Provider<List<HeroCardModel>>((ref) {
  return mockHeroCards;
});
//
