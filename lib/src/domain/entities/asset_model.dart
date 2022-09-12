
class AssetModel {
  String id;
  int serialId;
  String symbol;
  String name;
  double price;
  double variation;
  double coinBalance;
  String icon;
  AssetModel({
    required this.id,
    required this.serialId,
    required this.symbol,
    required this.name,
    required this.price,
    required this.variation,
    required this.coinBalance,
    required this.icon,
  });
}
