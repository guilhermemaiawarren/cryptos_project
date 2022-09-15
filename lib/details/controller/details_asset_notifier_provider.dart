import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/decimal_parse.dart';

final detailsAssetProvider =
    StateNotifierProvider<DetailsAssetNotifier, AssetModel>(
  (ref) => DetailsAssetNotifier(),
);

class DetailsAssetNotifier extends StateNotifier<AssetModel> {
  DetailsAssetNotifier()
      : super(AssetModel(
          coinBalance: dp('1'),
          currentPrice: dp('1'),
          icon: '',
          id: '',
          name: '',
          prices: [],
          serialId: 2,
          symbol: '',
          variation: 1.2,
        ));

  void changeDetailsAsset(AssetModel model) {
    state = model;
  }
}
