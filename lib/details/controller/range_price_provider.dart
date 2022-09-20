import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

var rangePriceProvider = StateNotifierProvider<RangeNotifier, Decimal>((ref) => RangeNotifier());

class RangeNotifier extends StateNotifier<Decimal> {
  RangeNotifier() : super(dp('0.0'));

  void changePriceByRange(int time, AssetModel model) {
    state = model.prices[time - 1];
  }
}