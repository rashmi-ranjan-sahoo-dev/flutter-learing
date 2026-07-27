class Campaign {
 
  final String title;
  final String ngoName;
  final String category;
  final String imageUrl;
  final int raisedAmount;
  final int targetAmount;
  final int donorCount;
  final int daysLeft;

   const Campaign({
    required this.title,
    required this.ngoName,
    required this.category,
    required this.imageUrl,
    required this.raisedAmount,
    required this.targetAmount,
    required this.donorCount,
    required this.daysLeft,
  });

}
