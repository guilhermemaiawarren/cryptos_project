import 'package:json_annotation/json_annotation.dart';

part 'cryptos_response.g.dart';

@JsonSerializable()
class CryptosResponse {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double variation;
  CryptosResponse(
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.variation,
  );

  factory CryptosResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptosResponseToJson(this);
}
