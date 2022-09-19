import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_criptos/portfolio/repo/data/dto/api_asset_model_dto.dart';
import 'package:projeto_criptos/shared/models/api_asset_model.dart';

abstract class IGetAssetsDatasource {
  Future<List<ApiAssetModel>> getAssets();
}

class GetAssetsDatasourceImpl implements IGetAssetsDatasource {
  GetAssetsDatasourceImpl(this.dio);
  final Dio dio;
  @override
  Future<List<ApiAssetModel>> getAssets() async {
    List<ApiAssetModel> assets = [];
    try {
      final response = await dio.get(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
      assets = List.from(
        response.data.map(
          (asset) => ApiAssetModelDto.fromMap(asset),
        ),
      );
    } catch (e, s) {
      debugPrint("$e , $s");
    }
    return assets;
  }
}
