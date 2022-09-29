import 'package:decimal/decimal.dart';

class MovementModel {
  Decimal convert;
  Decimal recieve;
  DateTime data;
  Decimal cashHelper;
  String convertCoinId;
  String recieveCoinId;
  MovementModel({
    required this.convert,
    required this.recieve,
    required this.data,
    required this.cashHelper,
    required this.convertCoinId,
    required this.recieveCoinId,
  });
}
