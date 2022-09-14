import '../models/asset_model.dart';

abstract class IGetAssetsRepository {
  List<AssetModel> getAssets();
}
