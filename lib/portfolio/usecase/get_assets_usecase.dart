import '../../shared/models/api_asset_model.dart';
import '../../shared/repository/assets_repository.dart';

abstract class IGetAssetsUsecase {
  Future<List<ApiAssetModel>> getAssets();
}

class GetAssetsUsecaseImpl implements IGetAssetsUsecase {
  final IGetAssetsRepository _repository;

  GetAssetsUsecaseImpl(this._repository);
  @override
  Future<List<ApiAssetModel>> getAssets() {
    return _repository.getAssets();
  }
}
