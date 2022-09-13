import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/controller/assets_notifier.dart';
import 'package:projeto_criptos/portfolio/usecase/get_assets_usecase.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/decimal_parse.dart';
import '../repo/assets_repository_impl.dart';

final assetsListProvider = Provider((ref) {
  return [
    AssetModel(
      id: "inoaifsamd-321j0sdad-32ldmsal",
      serialId: 6097,
      symbol: "BTC",
      name: "Bitcoin",
      currentPrice: dp('109204.21'),
      variation: 8.5,
      coinBalance: dp('0.51'),
      icon: 'assets/icons/btc.png',
      prices: [],
    ),
    AssetModel(
      id: "inoaifsamd-321j0sdad-dsasad",
      serialId: 6059,
      symbol: "ETH",
      name: "Ethereum",
      currentPrice: dp('8682.12'),
      variation: -12,
      coinBalance: dp('0.85'),
      icon: 'assets/icons/ethereum.png',
      prices: [],
    ),
    AssetModel(
      id: "inoaifsamd-321j0sdad-sdawa",
      serialId: 6075,
      symbol: "LTC",
      name: "Litecoin",
      currentPrice: dp('21'),
      variation: 5.8,
      coinBalance: dp('45.21'),
      icon: 'assets/icons/litecoin.png',
      prices: [],
    ),
  ];
});

final assetsRepoProvider = Provider(
  (ref) => GetAssetsRepositoryImpl(
    ref.watch(assetsListProvider),
  ),
);

final assetsUsecaseProvider = Provider(
  (ref) => GetAssetsUsecaseImpl(
    ref.watch(assetsRepoProvider),
  ),
);

var assetsProvider = StateNotifierProvider<AssetsNotifier, List<AssetModel>>(
  (ref) => AssetsNotifier(
    ref.watch(assetsUsecaseProvider),
  ),
);
