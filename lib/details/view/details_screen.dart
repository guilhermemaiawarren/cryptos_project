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
                    Text(
                      model.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(47, 47, 51, 1),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: Image.asset(model.icon).image,
                    ),
                  ],
                ),
                Text(model.symbol),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    currencyFormatter.format(
                      dtd(model.currentPrice),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromRGBO(47, 47, 51, 1),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                DetailsGraph(
                  model: model,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
            ),
            child: Column(
              children: [
                const Divider(thickness: 1),
                InfoCardDetails(
                  label: 'Preço Atual',
                  text: currencyFormatter.format(
                    dtd(model.currentPrice),
                  ),
                ),
                const Divider(thickness: 1),
                InfoCardDetails(
                  label: 'Variação 24H',
                  text:
                      '${model.variation > 0 ? '+' : ''}${model.variation.toString()}%',
                  color: model.variation > 0 ? Colors.green : Colors.red,
                ),
                const Divider(thickness: 1),
                InfoCardDetails(
                  label: 'Quantidade',
                  text: '${model.coinBalance.toString()} ${model.symbol}',
                ),
                const Divider(thickness: 1),
                InfoCardDetails(
                  label: 'Valor',
                  text: currencyFormatter.format(
                    dtd(model.coinBalance) * dtd(model.currentPrice),
                  ),
                ),
              ],
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

class InfoCardDetails extends StatelessWidget {
  const InfoCardDetails({
    Key? key,
    required this.label,
    required this.text,
    this.color,
  }) : super(key: key);

  final String label;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Text(
            text,
            style: TextStyle(
              color: color ??const Color.fromRGBO(47, 47, 51, 1),
              fontSize: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 35),
          ),
        ],
      ),
    );
  }
}
