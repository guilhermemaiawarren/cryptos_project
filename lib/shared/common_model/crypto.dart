import 'package:decimal/decimal.dart';

class CryptoEntity {
   String id;
   String symbol;
   String name;
   String image;
   Decimal currentPrice;
   double variation;
  CryptoEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.variation,
  });
}