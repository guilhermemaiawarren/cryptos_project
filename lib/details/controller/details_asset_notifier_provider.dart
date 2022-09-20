import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/asset_model.dart';

final detailsAssetProvider =
    StateNotifierProvider<DetailsAssetNotifier, AssetModel>(
  (ref) => DetailsAssetNotifier(),
);

class DetailsAssetNotifier extends StateNotifier<AssetModel> {
  DetailsAssetNotifier()
      : super(
          AssetModel(
            id: '',
            symbol: 'symbol',
            name: 'name',
            image: 'image',
            currentPrice: 2,
            priceChangePercentage: 2,
          ),
        );

  void changeVariation(int time, List<double> list) {
    time = time == 1 ? 2 : time;
    state.priceChangePercentage =
        (list.last / list.first - 1) * 100;
  }
}
