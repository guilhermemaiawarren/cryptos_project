import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../controller/details_asset_notifier_provider.dart';
import '../controller/get_historic_data_provider.dart';
import '../controller/list_provider.dart';
import '../controller/range_price_provider.dart';
import '../widgets/body_details_screen.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends HookConsumerWidget {
  const DetailsScreen({Key? key, required this.asset}) : super(key: key);
  static const route = '/details';

  final CryptoViewData asset;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as CryptoViewData;
    CryptoViewData asset = args;
    Future.delayed(Duration.zero, () async {
      await ref
          .read(getHistoricDataProvider.notifier)
          .getHistoricData(asset.id, 1);
      ref.read(listProvider.state).state =
          ref.read(getHistoricDataProvider.notifier).state;
      ref
          .read(detailsAssetProvider.notifier)
          .changeVariation(1, ref.read(getHistoricDataProvider.notifier).state);
    });
    ref.read(rangePriceProvider.notifier).state = asset.currentPrice;
    ref.read(detailsAssetProvider.notifier).state = asset;
    return const Scaffold(
      appBar: DetailsAppBar(),
      body: BodyDetailsScreen(),
    );
  }
}
