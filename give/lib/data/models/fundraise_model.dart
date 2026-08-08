class FundraiserModel {
  final String image;
  final String title;
  final String organizer;
  final int donations;
  final int daysLeft;
  final double raisedAmount;
  final double goalAmount;

  const FundraiserModel({
    required this.image,
    required this.title,
    required this.organizer,
    required this.donations,
    required this.daysLeft,
    required this.raisedAmount,
    required this.goalAmount,
  });

  double get progress => raisedAmount / goalAmount;
}