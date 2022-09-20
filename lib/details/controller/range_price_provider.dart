import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

var rangePriceProvider = StateNotifierProvider<RangeNotifier, double>((ref) => RangeNotifier());

class RangeNotifier extends StateNotifier<double> {
  RangeNotifier() : super(0.0);

  void changePriceByRange(int time, AssetModel model) {
    state = model.currentPrice;
  }
}