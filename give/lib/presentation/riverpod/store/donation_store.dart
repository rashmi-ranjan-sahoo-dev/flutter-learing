import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/donaton.dart';

final List<Donation> donationStore = [
  Donation(donorName: 'srinivas choppalli', amount: '₹2,500'),
  Donation(donorName: 'Varun Agrawal', amount: '₹5,000'),
  Donation(donorName: 'Shreya Pramanik', amount: '₹1,000'),
  Donation(donorName: 'Ananya Sharma', amount: '₹3,500'),
  Donation(donorName: 'Rohan Mehta', amount: '₹2,000'),
];

final donationProvider = Provider<List<Donation>>((ref) {
  return donationStore;
});

//stores in notion give
