
class AssetModel {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double priceChangePercentage;
  AssetModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage,
  });
}
