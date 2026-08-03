import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:give/data/models/hero_card_model.dart';
import './hero_store.dart';

final List<HeroCardModel> mockHeroCards = [
  HeroCardModel(
    id: '1',
    title: 'Clean the Ocean Initiative',
    btnText: 'Donate Now',
    imageUrl: 'https://snippets.freshchat.com/js/fc-pre-chat-form-v2.min.js',
  ),
  HeroCardModel(
    id: '2',
    title: 'Emergency Animal Rescue',
    btnText: 'Support Shelter',
    imageUrl: 'https://cfstatic.give.do/e74ed6df-5453-4ca1-8ed8-23e45ded0fe1.webp',
  ),
  HeroCardModel(
    id: '3',
    title: 'Plant 1,000 Trees Today',
    btnText: 'Plant a Tree',
    imageUrl: 'https://cfstatic.give.do/5088f90b-2a70-449b-af9a-95a760965b12.webp',
  ),
   HeroCardModel(
    id: '4',
    title: 'Clean the Ocean Initiative',
    btnText: 'Donate Now',
    imageUrl: 'https://snippets.freshchat.com/js/fc-pre-chat-form-v2.min.js',
  ),
  HeroCardModel(
    id: '5',
    title: 'Emergency Animal Rescue',
    btnText: 'Support Shelter',
    imageUrl: 'https://cfstatic.give.do/e74ed6df-5453-4ca1-8ed8-23e45ded0fe1.webp',
  ),
  HeroCardModel(
    id: '6',
    title: 'Plant 1,000 Trees Today',
    btnText: 'Plant a Tree',
    imageUrl: 'https://cfstatic.give.do/5088f90b-2a70-449b-af9a-95a760965b12.webp',
  ),
];

final heroCardsProvider = Provider<List<HeroCardModel>>((ref) {
  return mockHeroCards;
});
