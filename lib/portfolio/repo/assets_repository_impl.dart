import 'package:projeto_criptos/portfolio/repo/data/datasource/assets_datasource.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../../shared/repository/assets_repository.dart';

class GetAssetsRepositoryImpl implements IGetAssetsRepository {
  final IGetAssetsDatasource _datasource;

  GetAssetsRepositoryImpl(this._datasource);
  @override
  Future<List<AssetModel>> getAssets() {
    return _datasource.getAssets();
  }
}
