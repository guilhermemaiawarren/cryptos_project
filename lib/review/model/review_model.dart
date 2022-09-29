import 'dart:convert';

import 'package:decimal/decimal.dart';

import '../../shared/common_model/crypto.dart';

class ReviewViewData extends CryptoEntity {
  ReviewViewData({
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

  factory ReviewViewData.fromMap(Map<String, dynamic> map) {
    return ReviewViewData(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['currentPrice'],
      variation: map['variation']?.toDouble() ?? 0.0,
    );
  }

  factory ReviewViewData.fromJson(String source) =>
      ReviewViewData.fromMap(json.decode(source));
}