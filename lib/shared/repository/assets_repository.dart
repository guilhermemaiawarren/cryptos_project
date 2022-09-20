import '../models/asset_model.dart';

abstract class IGetAssetsRepository {
  Future<List<AssetModel>> getAssets();
}
