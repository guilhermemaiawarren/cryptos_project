import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';


final detailsAssetProvider =
    StateNotifierProvider<DetailsAssetNotifier, CryptoViewData>(
  (ref) => DetailsAssetNotifier(),
);

class DetailsAssetNotifier extends StateNotifier<CryptoViewData> {
  DetailsAssetNotifier()
      : super(
          CryptoViewData(
            id: '',
            symbol: 'symbol',
            name: 'name',
            image: 'image',
            currentPrice: 2,
            variation: 2,
          ),
        );

  void changeVariation(int time, List<double> list) {
    time = time == 1 ? 2 : time;
    state.variation =
        (list.last / list.first - 1) * 100;
  }
}
