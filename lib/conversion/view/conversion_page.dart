import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:projeto_criptos/conversion/widgets/floating_cripto_button.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';

import '../../shared/common_model/crypto.dart';
import '../widgets/conversion_screen.dart';

class ConversionPage extends StatelessWidget {
  ConversionPage({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  static const route = '/conversion';
  Decimal coinAmmount;
  CryptoEntity asset;
  bool validate = false;
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
