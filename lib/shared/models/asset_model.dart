
import 'package:decimal/decimal.dart';
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
  List<Decimal> dayPrices;
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
    required this.dayPrices,
  });
}
