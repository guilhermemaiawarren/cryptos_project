import 'package:projeto_criptos/portfolio/data/datasource/assets_datasource.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

class GetAssetsRepositoryImpl implements IGetAssetsRepository {
  final IGetAssetsDatasource _datasource;

  GetAssetsRepositoryImpl(this._datasource);
  @override
  Future<List<AssetModel>> getAssets() {
    return _datasource.getAssets();
  }
}

abstract class IGetAssetsRepository {
  Future<List<AssetModel>> getAssets();
}
