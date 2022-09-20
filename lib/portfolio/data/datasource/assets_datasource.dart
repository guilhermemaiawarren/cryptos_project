import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_criptos/portfolio/data/dto/asset_model_dto.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

abstract class IGetAssetsDatasource {
  Future<List<AssetModel>> getAssets();
}

class GetAssetsDatasourceImpl implements IGetAssetsDatasource {
  GetAssetsDatasourceImpl(this.dio);
  final Dio dio;
  @override
  Future<List<AssetModel>> getAssets() async {
    List<AssetModel> assets = [];
    try {
      final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false',
      );
      return List.from(
        response.data.map(
          (asset) => AssetModelDto.fromMap(asset),
        ),
      );
    } catch (e, s) {
      debugPrint("$e , $s");
    }
    return assets;
  }
}
