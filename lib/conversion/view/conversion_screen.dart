import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/conversion_controller.dart';
import '../widgets/available_balance_container.dart';
import '../widgets/coin_button.dart';
import '../widgets/coin_text_field.dart';
import '../widgets/helper_currency_text.dart';
import '../widgets/informative_text.dart';
import '../widgets/swap_icon_button.dart';
import '../widgets/total_convert_value_container.dart';

class ConversionScreen extends ConsumerStatefulWidget {
  const ConversionScreen({
    super.key,
    required this.controller,
  });
  final ConversionController controller;
  @override
  ConsumerState<ConversionScreen> createState() => _BodyConversionScreenState();
}

class _BodyConversionScreenState extends ConsumerState<ConversionScreen> {
  final TextEditingController convertController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      setState(() {});
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvailableBalanceContainer(
          asset: widget.controller.asset,
          coinAmmount: widget.controller.coinAmmount,
        ),
        const InformativeText(
          key: Key('InformativeText'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CoinButton(
              formKey: formKey,
              value: convertController.text,
              id: '1',
              key: const Key('ConvertAsset'),
              controller: widget.controller,
              asset: widget.controller.asset,
            ),
            SwapIconButton(
              key: const Key('SwapButton'),
              controller: widget.controller,
            ),
            CoinButton(
              key: const Key('RecieveAsset'),
              asset: widget.controller.cryptoConverted,
              formKey: formKey,
              id: '2',
              value: convertController.text,
              controller: widget.controller,
            ),
          ],
        ),
        CoinTextField(
          formKey: formKey,
          controller: convertController,
          asset: widget.controller.asset,
        ),
        HelperCurrencyText(convertHelper: widget.controller.convertHelper),
        Expanded(
          child: TotalConvertValueContainer(
            convertedCryptoHelper: widget.controller.convertedCryptoHelper,
            cryptoConverted: widget.controller.cryptoConverted,
          ),
        ),
      ],
    );
  }
}
