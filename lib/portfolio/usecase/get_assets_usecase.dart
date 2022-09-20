import '../../shared/models/asset_model.dart';
import '../../shared/repository/assets_repository.dart';

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
