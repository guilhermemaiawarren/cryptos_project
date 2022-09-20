import '../../shared/models/asset_model.dart';
import '../../shared/repository/assets_repository.dart';


class GetAssetsRepositoryImpl implements IGetAssetsRepository {
  List<AssetModel> lista;

  GetAssetsRepositoryImpl(this.lista);
  @override
  List<AssetModel> getAssets() {
    return lista;
  }
}