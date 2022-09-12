import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/asset_model.dart';

var assetsProvider = Provider((ref) => assets);

List<AssetModel> assets = [
  AssetModel(
    id: "inoaifsamd-321j0sdad-32ldmsal",
    serialId: 6097,
    symbol: "BTC",
    name: "Bitcoin",
    price: 109204.21,
    variation: 8.5,
    coinBalance: 0.51,
    icon: 'assets/icons/btc.png'
  ),
  AssetModel(
    id: "inoaifsamd-321j0sdad-dsasad",
    serialId: 6059,
    symbol: "ETH",
    name: "Ethereum",
    price: 8682.12,
    variation: -12,
    coinBalance: 0.85,
    icon: 'assets/icons/ethereum.png'
  ),
  AssetModel(
    id: "inoaifsamd-321j0sdad-sdawa",
    serialId: 6075,
    symbol: "LTC",
    name: "Litecoin",
    price: 21,
    variation: 5.8,
    coinBalance: 45.21,
    icon: 'assets/icons/litecoin.png'
  ),
];
