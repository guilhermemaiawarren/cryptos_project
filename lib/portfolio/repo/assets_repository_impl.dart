import 'package:projeto_criptos/shared/models/asset_model.dart';

abstract class IGetAssetsRepository {
  List<AssetModel> getAssets();
}