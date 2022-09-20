import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/list_provider.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../../portfolio/controller/arguments.dart';
import '../controller/details_asset_notifier_provider.dart';
import '../controller/get_historic_data_provider.dart';
import '../controller/range_price_provider.dart';
import '../widgets/body_details_screen.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends HookConsumerWidget {
  const DetailsScreen({Key? key, required this.asset}) : super(key: key);
  static const route = '/details';

  final AssetModel asset;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    AssetModel asset = args.asset;

    Future.delayed(Duration.zero, () async {
      await ref
          .read(getHistoricDataProvider.notifier)
          .getHistoricData(asset.id, 1);
      ref.read(listProvider.state).state =
          ref.read(getHistoricDataProvider.notifier).state;
    });
    ref.read(getHistoricDataProvider.notifier).getHistoricData(asset.id, 1);
    ref.read(detailsAssetProvider.notifier).state = asset;
    ref.read(rangePriceProvider.notifier).changePriceByRange(1, asset);
    return const Scaffold(
      appBar: DetailsAppBar(),
      body: BodyDetailsScreen(),
    );
  }
}
