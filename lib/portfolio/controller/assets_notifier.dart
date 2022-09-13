import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/usecase/get_assets_usecase.dart';

import '../../shared/models/asset_model.dart';

class AssetsNotifier extends StateNotifier<List<AssetModel>> {
  AssetsNotifier(this._usecase) : super([]);
  final IGetAssetsUsecase _usecase;

  void getAllAssets() {
    state = _usecase.getAssets();
  }
}
