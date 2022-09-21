// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_cryptos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCryptosResponse _$GetAllCryptosResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCryptosResponse(
      (json['cryptos'] as List<dynamic>)
          .map((e) => CryptosResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCryptosResponseToJson(
        GetAllCryptosResponse instance) =>
    <String, dynamic>{
      'cryptos': instance.cryptos,
    };
