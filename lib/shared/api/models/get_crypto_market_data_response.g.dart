// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_market_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoMarketDataResponse _$GetCryptoMarketDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetCryptoMarketDataResponse(
      (json['prices'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$GetCryptoMarketDataResponseToJson(
        GetCryptoMarketDataResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
    };
