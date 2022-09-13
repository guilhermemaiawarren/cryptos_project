import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

final detailsAssetProvider =
    StateNotifierProvider<DetailsAssetNotifier, AssetModel>(
  (ref) => DetailsAssetNotifier(),
);

class DetailsAssetNotifier extends StateNotifier<AssetModel> {
  DetailsAssetNotifier() : super(asset);

  void changeDetailsAsset(AssetModel model) {
    asset = model;
    state = asset;
  }
}

AssetModel asset = AssetModel(
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
