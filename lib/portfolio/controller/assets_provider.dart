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
      variation: -8.5,
      coinBalance: dp('0.51'),
      icon: 'assets/icons/btc.png',
      prices: [
        dp('109567.21'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('108211.67'),
        dp('110774.21'),
        dp('112756.65'),
        dp('109567.21'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('108211.67'),
        dp('110774.21'),
        dp('112756.65'),
        dp('109567.21'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('108211.67'),
        dp('110774.21'),
        dp('112756.65'),
        dp('109567.21'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('108211.67'),
        dp('110774.21'),
        dp('112756.65'),
        dp('109567.21'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('150211.67'),
        dp('142774.21'),
        dp('152756.65'),
        dp('152756.65'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('150211.67'),
        dp('142774.21'),
        dp('152756.65'),
        dp('152756.65'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('150211.67'),
        dp('142774.21'),
        dp('152756.65'),
        dp('152756.65'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('150211.67'),
        dp('142774.21'),
        dp('152756.65'),
        dp('152756.65'),
        dp('104214.63'),
        dp('105215.21'),
        dp('107952.21'),
        dp('115944.00'),
        dp('120212.54'),
        dp('116212.24'),
        dp('150211.67'),
        dp('142774.21'),
        dp('152756.65'),
        dp('152756.65'),
      ],
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
      prices: [
        dp('8682.12'),
        dp('9000.12'),
        dp('9756.21'),
        dp('10987.00'),
        dp('8643.90'),
        dp('8750.45'),
        dp('8150.46'),
        dp('7850.73'),
        dp('7900.00'),
        dp('7320.21'),
        dp('8000.00'),
        dp('8200.09'),
        dp('8500.41'),
        dp('7200.11'),
        dp('6500.21'),
        dp('8682.12'),
        dp('9000.12'),
        dp('9756.21'),
        dp('10987.00'),
        dp('8643.90'),
        dp('8750.45'),
        dp('8150.46'),
        dp('7850.73'),
        dp('7900.00'),
        dp('7320.21'),
        dp('8000.00'),
        dp('8200.09'),
        dp('8500.41'),
        dp('7200.11'),
        dp('6500.21'),
        dp('8682.12'),
        dp('9000.12'),
        dp('9756.21'),
        dp('10987.00'),
        dp('8643.90'),
        dp('8750.45'),
        dp('8150.46'),
        dp('7850.73'),
        dp('7900.00'),
        dp('7320.21'),
        dp('8000.00'),
        dp('8200.09'),
        dp('8500.41'),
        dp('7200.11'),
        dp('6500.21'),
        dp('8682.12'),
        dp('9000.12'),
        dp('9756.21'),
        dp('10987.00'),
        dp('8643.90'),
        dp('8750.45'),
        dp('8150.46'),
        dp('7850.73'),
        dp('7900.00'),
        dp('7320.21'),
        dp('8000.00'),
        dp('8200.09'),
        dp('8500.41'),
        dp('7200.11'),
        dp('6500.21'),
        dp('8682.12'),
        dp('9000.12'),
        dp('9756.21'),
        dp('10987.00'),
        dp('8643.90'),
        dp('8750.45'),
        dp('8150.46'),
        dp('7850.73'),
        dp('7900.00'),
        dp('7320.21'),
        dp('8000.00'),
        dp('8200.09'),
        dp('8500.41'),
        dp('7200.11'),
        dp('6500.21'),
        dp('8682.12'),
        dp('9000.12'),
        dp('9756.21'),
        dp('10987.00'),
        dp('8643.90'),
        dp('8750.45'),
        dp('8150.46'),
        dp('7850.73'),
        dp('7900.00'),
        dp('7320.21'),
        dp('8000.00'),
        dp('8200.09'),
        dp('8500.41'),
        dp('7200.11'),
        dp('6500.21'),
      ],
    ),
    AssetModel(
      id: "inoaifsamd-321j0sdad-sdawa",
      serialId: 6075,
      symbol: "LTC",
      name: "Litecoin",
      currentPrice: dp('280.56'),
      variation: 5.8,
      coinBalance: dp('45.21'),
      icon: 'assets/icons/litecoin.png',
      prices: [
        dp('280.56'),
        dp('290.21'),
        dp('353.12'),
        dp('310.90'),
        dp('300.21'),
        dp('280.41'),
        dp('265.21'),
        dp('286.65'),
        dp('295.09'),
        dp('300.51'),
        dp('315.21'),
        dp('322.61'),
        dp('317.14'),
        dp('340.21'),
        dp('325.73'),
        dp('280.56'),
        dp('290.21'),
        dp('353.12'),
        dp('310.90'),
        dp('300.21'),
        dp('280.41'),
        dp('265.21'),
        dp('286.65'),
        dp('295.09'),
        dp('300.51'),
        dp('315.21'),
        dp('322.61'),
        dp('317.14'),
        dp('340.21'),
        dp('325.73'),
        dp('280.56'),
        dp('290.21'),
        dp('353.12'),
        dp('310.90'),
        dp('300.21'),
        dp('280.41'),
        dp('265.21'),
        dp('286.65'),
        dp('295.09'),
        dp('300.51'),
        dp('315.21'),
        dp('322.61'),
        dp('317.14'),
        dp('340.21'),
        dp('325.73'),
        dp('280.56'),
        dp('290.21'),
        dp('353.12'),
        dp('310.90'),
        dp('300.21'),
        dp('280.41'),
        dp('265.21'),
        dp('286.65'),
        dp('295.09'),
        dp('300.51'),
        dp('315.21'),
        dp('322.61'),
        dp('317.14'),
        dp('340.21'),
        dp('325.73'),
        dp('280.56'),
        dp('290.21'),
        dp('353.12'),
        dp('310.90'),
        dp('300.21'),
        dp('280.41'),
        dp('265.21'),
        dp('286.65'),
        dp('295.09'),
        dp('300.51'),
        dp('315.21'),
        dp('322.61'),
        dp('317.14'),
        dp('340.21'),
        dp('325.73'),
        dp('280.56'),
        dp('290.21'),
        dp('353.12'),
        dp('310.90'),
        dp('300.21'),
        dp('280.41'),
        dp('265.21'),
        dp('286.65'),
        dp('295.09'),
        dp('300.51'),
        dp('315.21'),
        dp('322.61'),
        dp('317.14'),
        dp('340.21'),
        dp('325.73'),
      ],
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
