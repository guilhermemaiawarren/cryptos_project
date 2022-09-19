import '../models/api_asset_model.dart';
import '../models/asset_model.dart';

abstract class IGetAssetsRepository {
  Future<List<ApiAssetModel>> getAssets();
}
