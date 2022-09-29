import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:projeto_criptos/review/widgets/info_review_column.dart';

import 'package:projeto_criptos/review/widgets/review_buttons.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';

class RevisionPage extends StatelessWidget {
  const RevisionPage({
    Key? key,
    required this.convert,
    required this.recieve,
    required this.convertCoin,
    required this.recieveCoin,
  }) : super(key: key);
  static const route = '/revision';
  final Decimal convert;
  final Decimal recieve;
  final CryptoEntity convertCoin;
  final CryptoEntity recieveCoin;

  String getExchange() {
    double exchange = dtd(convertCoin.currentPrice) / dtd(recieveCoin.currentPrice);
    return '1 ${convertCoin.symbol.toUpperCase()} = ${exchange.toStringAsFixed(7)} ${recieveCoin.symbol.toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ModelAppBar(text: 'Revisar'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Revise os dados da sua conversão',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            InfoReviewColumn(
              convert:
                  '${convert.toString()} ${convertCoin.symbol.toUpperCase()}',
              recieve:
                  '${recieve.toStringAsFixed(6)} ${recieveCoin.symbol.toUpperCase()}',
              cambio: getExchange(),
            ),
            const ReviewButtons(),
          ],
        ),
      ),
    );
  }
}
