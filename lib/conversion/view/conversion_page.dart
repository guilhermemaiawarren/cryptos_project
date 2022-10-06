import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/provider/controller_provider.dart';
import 'package:projeto_criptos/conversion/widgets/floating_cripto_button.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/portfolio/provider/cryptos_provider.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import '../../shared/templates/model_app_bar.dart';

import 'conversion_screen.dart';

class ConversionPage extends ConsumerStatefulWidget {
  const ConversionPage({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  static const route = '/conversion';
  final Decimal coinAmmount;
  final CryptoEntity asset;

  @override
  ConsumerState<ConversionPage> createState() => _$ConversionPageState();
}

class _$ConversionPageState extends ConsumerState<ConversionPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final cryptos = ref.watch(cryptosProvider);
      await ref.read(convertControllerProvider.notifier).controllerInit(
          widget.asset, widget.coinAmmount, cryptos.asData!.value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ModelAppBar(text: CoreStrings.of(context)!.convert),
      body: ConversionScreen(
        coinAmmount: widget.coinAmmount,
        asset: widget.asset,
      ),
      floatingActionButton: const FloatingCriptoButton(),
    );
  }
}
