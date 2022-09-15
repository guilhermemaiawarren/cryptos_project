
import 'package:decimal/decimal.dart';
//TODO 24H Prices list
class AssetModel {
  String id;
  int serialId;
  String symbol;
  String name;
  Decimal currentPrice;
  double variation;
  Decimal coinBalance;
  String icon;
  List<Decimal> prices;
  AssetModel({
    required this.id,
    required this.serialId,
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.variation,
    required this.coinBalance,
    required this.icon,
    required this.prices,
  });
}
