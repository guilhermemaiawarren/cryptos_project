import 'package:projeto_criptos/portfolio/repo/assets_repository_impl.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';


class GetAssetsRepositoryImpl implements IGetAssetsRepository {
  List<AssetModel> lista;

  GetAssetsRepositoryImpl(this.lista);
  @override
  List<AssetModel> getAssets() {
    return lista;
  }
}
