import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/data/datasource/assets_datasource.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../repo/assets_repository_impl.dart';
import '../usecase/get_assets_usecase.dart';
import 'assets_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final assetsDatasourceProvider = Provider(
  (ref) => GetAssetsDatasourceImpl(
    ref.watch(dioProvider),
  ),
);

final assetsRepoProvider = Provider(
  (ref) => GetAssetsRepositoryImpl(
    ref.watch(assetsDatasourceProvider),
  ),
);

final assetsUsecaseProvider = Provider(
  (ref) => GetAssetsUsecaseImpl(
    ref.watch(assetsRepoProvider),
  ),
);

var assetsNotifierProvider = StateNotifierProvider<AssetsNotifier, List<AssetModel>>(
  (ref) => AssetsNotifier(
    ref.watch(assetsUsecaseProvider),
  ),
);
