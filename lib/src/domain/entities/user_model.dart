import 'package:crypto_font_icons/crypto_font_icons.dart';

import 'asset_model.dart';

class UserModel {
  String name = "Guilherme";
  List<AssetModel> assets = [
    AssetModel(
      id: "inoaifsamd-321j0sdad-dsasad",
      serialId: 6059,
      symbol: "ETH",
      name: "Ethereum",
      price: 8682.12,
      variation: -12,
      icon: CryptoFontIcons.ETH,
      coinBalance: 0.85,
    ),
    AssetModel(
      id: "inoaifsamd-321j0sdad-32ldmsal",
      serialId: 6097,
      symbol: "BTC",
      name: "Bitcoin",
      price: 109204.21,
      variation: 8.5,
      icon: CryptoFontIcons.BTC,
      coinBalance: 0.51,
    ),
    AssetModel(
      id: "inoaifsamd-321j0sdad-sdawa",
      serialId: 6075,
      symbol: "LTC",
      name: "Litecoin",
      price: 321.21,
      variation: 5.8,
      icon: CryptoFontIcons.LTC,
      coinBalance: 45.21,
    ),
  ];
  double balance = 0;

  double increaseBalance(List<AssetModel> list) {
    double balance = 0;
    for (AssetModel model in list) {
      balance += model.coinBalance * model.price;
    }
    return balance;
  }
}
