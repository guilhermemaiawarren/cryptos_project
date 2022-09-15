import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/decimal_to_double.dart';

var variationProvider = StateNotifierProvider<VariationNotifier, double>(
    (ref) => VariationNotifier());

class VariationNotifier extends StateNotifier<double> {
  VariationNotifier() : super(0.0);

  void changeVariation(int time, AssetModel model) {
    double variation = 0;
    time = time == 1 ? 2 : time;
    variation =
        (dtd(model.prices.first) / dtd(model.prices.elementAt(time - 1)) - 1) *
            100;
    state = variation;
  }
}
