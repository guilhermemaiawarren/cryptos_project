// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:projeto_criptos/shared/models/api_asset_model.dart';

// import '../../shared/models/asset_model.dart';
// import '../../shared/utils/decimal_parse.dart';
// import '../../shared/utils/decimal_to_double.dart';

// final detailsAssetProvider =
//     StateNotifierProvider<DetailsAssetNotifier, ApiAssetModel>(
//   (ref) => DetailsAssetNotifier(),
// );

// class DetailsAssetNotifier extends StateNotifier<ApiAssetModel> {
//   DetailsAssetNotifier()
//       : super(
//           AssetModel(
//             coinBalance: dp('1'),
//             currentPrice: dp('1'),
//             icon: '',
//             id: '',
//             name: '',
//             prices: [],
//             serialId: 2,
//             symbol: '',
//             variation: 1.2,
//             dayPrices: [],
//           ),
//         );

//   void changeVariation(int time) {
//     time = time == 1 ? 2 : time;
//     state.variation =
//         (dtd(state.prices.first) / dtd(state.prices.elementAt(time - 1)) - 1) *
//             100;
//   }
// }
