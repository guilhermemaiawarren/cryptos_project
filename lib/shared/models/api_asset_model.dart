
class ApiAssetModel {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double priceChangePercentage;
  ApiAssetModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage,
  });
}
