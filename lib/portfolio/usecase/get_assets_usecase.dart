import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../../shared/repository/assets_repository.dart';

abstract class IGetAssetsUsecase {
  List<AssetModel> getAssets();
}

class GetAssetsUsecaseImpl implements IGetAssetsUsecase {
  final IGetAssetsRepository _repository;

  GetAssetsUsecaseImpl(this._repository);
  @override
  List<AssetModel> getAssets() {
    return _repository.getAssets();
  }
}
