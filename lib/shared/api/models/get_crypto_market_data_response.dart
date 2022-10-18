import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_market_data_response.g.dart';

@JsonSerializable()
class GetCryptoMarketDataResponse {
  List<List<num>> prices;

  GetCryptoMarketDataResponse(this.prices);

  factory GetCryptoMarketDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCryptoMarketDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCryptoMarketDataResponseToJson(this);
}
