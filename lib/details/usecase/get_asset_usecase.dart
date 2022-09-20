import '../../shared/models/asset_model.dart';

abstract class IGetAssetUsecase {
  AssetModel getAsset();
}

class GetAssetUsecase implements IGetAssetUsecase {
  @override
  AssetModel getAsset() {
    throw UnimplementedError();
  }

}