import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_criptos/details/controller/details_asset_provider.dart';
import 'package:projeto_criptos/details/widgets/change_x_axis_buttons.dart';
import 'package:projeto_criptos/details/widgets/graph_details.dart';
import 'package:projeto_criptos/details/widgets/top_page_asset_container.dart';
import 'package:projeto_criptos/shared/utils/currency_formater.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';

import '../../shared/models/asset_model.dart';
import '../widgets/info_card_details.dart';

class DetailsScreen extends StatefulHookConsumerWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String route = '/details';

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    AssetModel model = ref.watch(detailsAssetProvider.notifier).state;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const TopPageAssetContainer(),
          GraphDetails(),
          const ChangeXAxisButtons(),
          InfoCardDetails(
            label: 'Preço Atual',
            text: currencyFormatter.format(
              dtd(model.currentPrice),
            ),
          ),
          InfoCardDetails(
            label: 'Variação 24H',
            text: '${model.variation.toString()}%',
            color: model.variation > 0 ? Colors.green : Colors.red,
          ),
          InfoCardDetails(
            label: 'Quantidade',
            text: '${model.coinBalance.toString()} ${model.symbol}',
          ),
          InfoCardDetails(
            label: 'Valor',
            text: currencyFormatter.format(
              dtd(model.coinBalance) * dtd(model.currentPrice),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: MaterialButton(
              color: const Color.fromRGBO(224, 43, 87, 1),
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {},
              child: const Text(
                'Converter moeda',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
