import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../usecase/get_assets_usecase.dart';

class AssetsNotifier extends StateNotifier<List<AssetModel>> {
  AssetsNotifier(this._usecase) : super([]) {
    getAllAssets();
  }
  final IGetAssetsUsecase _usecase;

  Future<void> getAllAssets() async {
    state = await _usecase.getAssets();
  }
}
