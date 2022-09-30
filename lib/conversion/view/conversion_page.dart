import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import '../widgets/floating_cripto_button.dart';
import '../../shared/templates/model_app_bar.dart';

import '../../shared/common_model/crypto.dart';
import '../widgets/conversion_screen.dart';

class ConversionPage extends StatelessWidget {
  const ConversionPage({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  static const route = '/conversion';
  final Decimal coinAmmount;
  final CryptoEntity asset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ModelAppBar(text: 'Converter'),
      body: ConversionScreen(
        coinAmmount: coinAmmount,
        asset: asset,
      ),
      floatingActionButton: const FloatingCriptoButton(),
    );
  }
}
