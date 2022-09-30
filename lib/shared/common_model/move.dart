import 'dart:convert';

import 'package:decimal/decimal.dart';

class MoveModel {
  Decimal convert;
  Decimal recieve;
  DateTime data;
  Decimal cashHelper;
  String convertCoinId;
  String recieveCoinId;
  MoveModel({
    required this.convert,
    required this.recieve,
    required this.data,
    required this.cashHelper,
    required this.convertCoinId,
    required this.recieveCoinId,
  });

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

  factory MoveModel.fromMap(Map<String, dynamic> map) {
    return MoveModel(
      convert: map['convert'],
      recieve: map['recieve'],
      data: DateTime.fromMillisecondsSinceEpoch(map['data']),
      cashHelper: map['cashHelper'],
      convertCoinId: map['convertCoinId'] ?? '',
      recieveCoinId: map['recieveCoinId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveModel.fromJson(String source) =>
      MoveModel.fromMap(json.decode(source));
}
