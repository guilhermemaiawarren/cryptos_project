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

  void changeVariation(int time) {
    time = time == 1 ? 2 : time;
    state.priceChangePercentage =
        (state.currentPrice / state.currentPrice - 1) * 100;
  }
}
