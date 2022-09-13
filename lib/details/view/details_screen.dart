import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_criptos/details/controller/details_asset_provider.dart';
import 'package:projeto_criptos/details/widgets/details_graph.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';
import 'package:projeto_criptos/shared/utils/currency_formater.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';

class DetailsScreen extends StatefulHookConsumerWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String route = '/details';

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

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
          Container(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(asset.name),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: Image.asset(asset.icon).image,
                    ),
                  ],
                ),
                Text(asset.symbol),
                Text(
                  currencyFormatter.format(
                    dtd(asset.currentPrice),
                  ),
                ),
                DetailsGraph(
                  model: asset,
                ),
              ],
            ),
          ),
          InfoCardDetails(
            label: 'Preço Atual',
            text: currencyFormatter.format(
              dtd(asset.currentPrice),
            ),
          ),
          InfoCardDetails(
            label: 'Variação 24H',
            text: '${asset.variation.toString()}%',
            style: TextStyle(
              color: asset.variation > 0 ? Colors.green : Colors.red,
            ),
          ),
          InfoCardDetails(
            label: 'Quantidade',
            text: '${asset.coinBalance.toString()} ${asset.symbol}',
          ),
          InfoCardDetails(
            label: 'Valor',
            text: currencyFormatter.format(
              dtd(asset.coinBalance) * dtd(asset.currentPrice),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => const Color.fromRGBO(224, 43, 87, 1),
                ),
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Converter moeda',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCardDetails extends StatelessWidget {
  const InfoCardDetails({
    Key? key,
    required this.label,
    required this.text,
    this.style,
  }) : super(key: key);

  final String label;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 5),
      child: Column(
        children: [
          const Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Text(label),
              const Spacer(),
              Text(text, style: style),
              const Padding(
                padding: EdgeInsets.only(right: 35),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
