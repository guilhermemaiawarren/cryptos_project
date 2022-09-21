// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptosResponse _$CryptosResponseFromJson(Map<String, dynamic> json) =>
    CryptosResponse(
      json['id'] as String,
      json['symbol'] as String,
      json['name'] as String,
      json['image'] as String,
      (json['currentPrice'] as num).toDouble(),
      (json['variation'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptosResponseToJson(CryptosResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
      'variation': instance.variation,
    };
