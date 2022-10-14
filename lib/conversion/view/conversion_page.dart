import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/core_strings.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/templates/model_app_bar.dart';
import '../provider/controller_provider.dart';
import '../widgets/floating_cripto_button.dart';
import 'conversion_screen.dart';

class ConversionPage extends ConsumerStatefulWidget {
  const ConversionPage({
    Key? key,
    required this.coinAmmount,
    required this.asset,
    required this.data,
    required this.coinAmmountList,
  }) : super(key: key);
  static const route = '/conversion';
  final Decimal coinAmmount;
  final CryptoViewData asset;
  final List<CryptoViewData> data;
  final List<double> coinAmmountList;

  @override
  ConsumerState<ConversionPage> createState() => _$ConversionPageState();
}

class _$ConversionPageState extends ConsumerState<ConversionPage> {
  @override
  Widget build(BuildContext context) {
    ref.read(convertControllerProvider.notifier).controllerInit(
          widget.asset,
          widget.coinAmmount,
          widget.data,
          widget.coinAmmountList,
        );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ModelAppBar(
        text: CoreStrings.of(context)!.convert,
      ),
      body: ConversionScreen(
        controller: ref.read(convertControllerProvider),
      ),
      floatingActionButton: const FloatingCriptoButton(),
    );
  }
}
