import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/decimal_parse.dart';

final detailsAssetProvider =
    StateNotifierProvider<DetailsAssetNotifier, AssetModel>(
  (ref) => DetailsAssetNotifier(),
);

class DetailsAssetNotifier extends StateNotifier<AssetModel> {
  DetailsAssetNotifier() : super(_asset);

  void changeDetailsAsset(AssetModel model) {
    _asset = model;
    state = _asset;
  }
}

AssetModel _asset = AssetModel(
  coinBalance: dp('1'),
  currentPrice: dp('1'),
  icon: '',
  id: '',
  name: '',
  prices: [],
  serialId: 2,
  symbol: '',
  variation: 1.2,
);
