import 'package:json_annotation/json_annotation.dart';

import 'cryptos_response.dart';

part 'get_all_cryptos_response.g.dart';

@JsonSerializable()
class GetAllCryptosResponse {
  List<CryptosResponse> cryptos;

  GetAllCryptosResponse(this.cryptos);

  factory GetAllCryptosResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCryptosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCryptosResponseToJson(this);
}
