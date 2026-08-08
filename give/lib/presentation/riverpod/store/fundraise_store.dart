import '../../../data/models/fundraise_model.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

final List<FundraiserModel> fundraiserList = [
  FundraiserModel(
    image:
        "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?q=80&w=600",
    title:
        "Help Dr Amruta provide life-saving cancer treatment to poor patients",
    organizer: "Charutar Arogya Mandal",
    donations: 1912,
    daysLeft: 2,
    raisedAmount: 2927532,
    goalAmount: 10000000,
  ),
  FundraiserModel(
    image:
        "https://images.unsplash.com/photo-1593113598332-cd288d649433?q=80&w=600",
    title: "Help Rajeev save centuries-old folk arts from disappearing forever",
    organizer: "Winner with You",
    donations: 326,
    daysLeft: 25,
    raisedAmount: 484671,
    goalAmount: 5000000,
  ),
  FundraiserModel(
    image:
        "https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=600",
    title:
        "Help Dr Amruta provide life-saving cancer treatment to poor patients",
    organizer: "Charutar Arogya Mandal",
    donations: 1912,
    daysLeft: 2,
    raisedAmount: 2927532,
    goalAmount: 10000000,
  ),
  FundraiserModel(
    image:
        "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?q=80&w=600",
    title: "Help Rajeev save centuries-old folk arts from disappearing forever",
    organizer: "Winner with You",
    donations: 326,
    daysLeft: 25,
    raisedAmount: 484671,
    goalAmount: 5000000,
  ),
];

final fundraiseProvider = Provider<List<FundraiserModel>>((ref) {
  return fundraiserList;
});
