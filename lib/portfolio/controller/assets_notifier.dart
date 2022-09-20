import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/asset_model.dart';
import '../usecase/get_assets_usecase.dart';

class AssetsNotifier extends StateNotifier<List<AssetModel>> {
  AssetsNotifier(this._usecase) : super([]);
  final IGetAssetsUsecase _usecase;

  void getAllAssets() {
    state = _usecase.getAssets();
  }
}
