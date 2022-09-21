
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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': currentPrice});
    result.addAll({'price_change_percentage_24h': variation});

    return result;
  }

  factory CryptosResponse.fromMap(Map<String, dynamic> map) {
    return CryptosResponse(
      map['id'] ?? '',
      map['symbol'] ?? '',
      map['name'] ?? '',
      map['image'] ?? '',
      map['current_price']?.toDouble() ?? 0.0,
      map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }
}
