import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/provider/controller_provider.dart';

import 'package:projeto_criptos/conversion/widgets/swap_icon_button.dart';
import 'package:projeto_criptos/conversion/widgets/total_convert_value_container.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import '../../shared/user/user_coin_ammount_provider.dart';
import '../../shared/utils/decimal_parse.dart';
import '../controller/conversion_controller.dart';
import '../widgets/available_balance_container.dart';
import '../widgets/coin_button.dart';
import '../widgets/coin_text_field.dart';
import '../widgets/helper_currency_text.dart';
import '../widgets/informative_text.dart';

class ConversionScreen extends ConsumerStatefulWidget {
  const ConversionScreen({
    super.key,
  });

  @override
  ConsumerState<ConversionScreen> createState() => _BodyConversionScreenState();
}

class _BodyConversionScreenState extends ConsumerState<ConversionScreen> {
  final TextEditingController convertController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ConversionController controller = ref.watch(convertControllerProvider);
    controller.addListener(() {
      setState(() {});
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvailableBalanceContainer(
          asset: controller.asset,
          coinAmmount: controller.coinAmmount,
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
              data: controller.cryptos,
              asset: controller.asset,
            ),
            SwapIconButton(
              key: const Key('SwapButton'),
              onPressed: () {
                setState(() {
                  controller.swapCoins();
                  controller.coinAmmount = dp(ref
                      .read(userCoinAmmountProvider)[controller.cryptos
                          .indexOf(controller.asset as CryptoViewData)]
                      .toString());
                });
              },
            ),
            CoinButton(
              key: const Key('RecieveAsset'),
              formKey: formKey,
              id: '2',
              value: convertController.text,
              data: controller.cryptos,
              asset: controller.cryptoConverted,
            ),
          ],
        ),
        CoinTextField(
          formKey: formKey,
          controller: convertController,
          asset: controller.asset,
        ),
        HelperCurrencyText(convertHelper: controller.convertHelper),
        Expanded(
          child: TotalConvertValueContainer(
            convertedCryptoHelper: controller.convertedCryptoHelper,
            cryptoConverted: controller.cryptoConverted,
          ),
        ),
      ],
    );
  }
}
