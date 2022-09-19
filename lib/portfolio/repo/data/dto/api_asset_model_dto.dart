import 'dart:convert';

import 'package:projeto_criptos/shared/models/api_asset_model.dart';

class ApiAssetModelDto extends ApiAssetModel {
  ApiAssetModelDto({
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

  factory ApiAssetModelDto.fromMap(Map<String, dynamic> map) {
    return ApiAssetModelDto(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'.replaceAll(RegExp('[0-9]'), '')] ?? '',
      currentPrice: map['current_price']?.toDouble() ?? 0.0,
      priceChangePercentage: map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  factory ApiAssetModelDto.fromJson(String source) =>
      ApiAssetModelDto.fromMap(json.decode(source));
}
