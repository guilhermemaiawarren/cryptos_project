import 'dart:convert';

import 'package:decimal/decimal.dart';

import 'package:projeto_criptos/shared/common_model/crypto.dart';

class ConversionCryptoViewData extends CryptoEntity {
  ConversionCryptoViewData({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required Decimal currentPrice,
    required double variation,
  }) : super(
          currentPrice: currentPrice,
          id: id,
          image: image,
          name: name,
          symbol: symbol,
          variation: variation,
        );

  factory ConversionCryptoViewData.fromMap(Map<String, dynamic> map) {
    return ConversionCryptoViewData(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['currentPrice'],
      variation: map['variation']?.toDouble() ?? 0.0,
    );
  }

  factory ConversionCryptoViewData.fromJson(String source) =>
      ConversionCryptoViewData.fromMap(json.decode(source));
}
