import 'dart:convert';

import 'package:decimal/decimal.dart';

import 'package:projeto_criptos/shared/common_model/move.dart';

class MovementModel extends MoveModel {
  MovementModel({
    required Decimal convert,
    required Decimal recieve,
    required DateTime data,
    required Decimal cashHelper,
    required String convertCoinId,
    required String recieveCoinId,
  }) : super(
          cashHelper: cashHelper,
          convert: convert,
          convertCoinId: convertCoinId,
          data: data,
          recieve: recieve,
          recieveCoinId: recieveCoinId,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'convert': convert});
    result.addAll({'recieve': recieve});
    result.addAll({'data': data.millisecondsSinceEpoch});
    result.addAll({'cashHelper': cashHelper});
    result.addAll({'convertCoinId': convertCoinId});
    result.addAll({'recieveCoinId': recieveCoinId});

    return result;
  }

  factory MovementModel.fromMap(Map<String, dynamic> map) {
    return MovementModel(
      convert: map['convert'],
      recieve: map['recieve'],
      data: DateTime.fromMillisecondsSinceEpoch(map['data']),
      cashHelper: map['cashHelper'],
      convertCoinId: map['convertCoinId'] ?? '',
      recieveCoinId: map['recieveCoinId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovementModel.fromJson(String source) =>
      MovementModel.fromMap(json.decode(source));
}
