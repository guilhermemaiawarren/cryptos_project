import 'dart:convert';

import 'package:projeto_criptos/shared/models/asset_model.dart';

class AssetModelDto extends AssetModel {
  AssetModelDto({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required double currentPrice,
    required double priceChangePercentage,
  }) : super(
          currentPrice: currentPrice,
          id: id,
          symbol: symbol,
          name: name,
          image: image,
          priceChangePercentage: priceChangePercentage,
        );

  factory AssetModelDto.fromMap(Map<String, dynamic> map) {
    return AssetModelDto(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'.replaceAll(RegExp('[0-9]'), '')] ?? '',
      currentPrice: map['current_price']?.toDouble() ?? 0.0,
      priceChangePercentage:
          map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  factory AssetModelDto.fromJson(String source) =>
      AssetModelDto.fromMap(json.decode(source));
}
