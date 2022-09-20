import 'package:projeto_criptos/portfolio/repo/assets_repository_impl.dart';

import '../../shared/models/asset_model.dart';

abstract class IGetAssetsUsecase {
  Future<List<AssetModel>> getAssets();
}

class GetAssetsUsecaseImpl implements IGetAssetsUsecase {
  final IGetAssetsRepository _repository;

  GetAssetsUsecaseImpl(this._repository);
  @override
  Future<List<AssetModel>> getAssets() {
    return _repository.getAssets();
  }
}
