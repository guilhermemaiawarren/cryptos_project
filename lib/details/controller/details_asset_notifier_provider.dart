import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';

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

  void changeVariation(int time, PricesViewData list) {
    time = time == 1 ? 2 : time;
    state.variation =
        (list.prices.last.last / list.prices.last.first - 1) * 100;
  }
}
