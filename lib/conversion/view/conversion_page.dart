import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/widgets/floating_cripto_button.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import '../../shared/templates/model_app_bar.dart';

import 'conversion_screen.dart';

class ConversionPage extends ConsumerWidget {
  const ConversionPage({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  static const route = '/conversion';
  final Decimal coinAmmount;
  final CryptoEntity asset;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ModelAppBar(text: CoreStrings.of(context)!.convert),
      body: ConversionScreen(
        coinAmmount: coinAmmount,
        asset: asset,
      ),
      floatingActionButton: const FloatingCriptoButton(),
    );
  }
}
