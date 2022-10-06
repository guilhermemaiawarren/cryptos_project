import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/provider/controller_provider.dart';

import 'package:projeto_criptos/conversion/widgets/swap_icon_button.dart';
import 'package:projeto_criptos/conversion/widgets/total_convert_value_container.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import '../../l10n/core_strings.dart';
import '../../shared/common_model/crypto.dart';
import '../../shared/user/user_coin_ammount_provider.dart';
import '../../shared/utils/decimal_parse.dart';
import '../controller/conversion_controller.dart';
import '../logicholder/methods/show_modal_bottom_sheet_cryptos.dart';
import 'available_balance_container.dart';
import 'coin_button.dart';
import 'coin_text_field.dart';
import 'helper_currency_text.dart';
import 'informative_text.dart';

class BodyConversionScreen extends ConsumerStatefulWidget {
  const BodyConversionScreen({
    Key? key,
    required this.coinAmmount,
    required this.asset,
    required this.data,
  }) : super(key: key);
  final Decimal coinAmmount;
  final CryptoEntity asset;
  final List<CryptoViewData> data;
  @override
  ConsumerState<BodyConversionScreen> createState() =>
      _BodyConversionScreenState();
}

class _BodyConversionScreenState extends ConsumerState<BodyConversionScreen> {
  final TextEditingController convertController = TextEditingController();
  // late CryptoEntity cryptoConverted;
  // late CryptoEntity asset;
  // late Decimal coinAmmount;
  // final formKey = GlobalKey<FormState>();
  // Decimal convertHelper = dp('0.0');
  // Decimal convertedCryptoHelper = dp('0.0');
  late ConversionController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller = ref.watch(convertControllerProvider);
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
              key: const Key('ConvertAsset'),
              data: widget.data,
              onPressed: () {
                showModalBottomSheetCryptos(
                  context,
                  widget.data,
                  ListView(
                    children: widget.data.map((crypto) {
                      return Column(
                        children: [
                          const Divider(thickness: 1),
                          ListTile(
                            onTap: () {
                              setState(() {
                                controller.changeConvertedCoin(
                                    crypto, convertController.text, formKey);
                                controller.coinAmmount = dp(ref
                                    .read(userCoinAmmountProvider)[widget.data
                                        .indexOf(
                                            controller.asset as CryptoViewData)]
                                    .toString());
                              });
                              Navigator.pop(context);
                            },
                            title: Text(
                              crypto.symbol.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(crypto.name),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
              asset: controller.asset,
            ),
            SwapIconButton(
              key: const Key('SwapButton'),
              onPressed: () {
                setState(() {
                  controller.swapCoins();
                  controller.coinAmmount = dp(ref
                      .read(userCoinAmmountProvider)[widget.data
                          .indexOf(controller.asset as CryptoViewData)]
                      .toString());
                });
                convertController.clear();
              },
            ),
            CoinButton(
              key: const Key('RecieveAsset'),
              data: widget.data,
              onPressed: () {
                showModalBottomSheetCryptos(
                  context,
                  widget.data,
                  ListView(
                    children: widget.data.map((crypto) {
                      return Column(
                        children: [
                          const Divider(thickness: 1),
                          ListTile(
                            onTap: () {
                              setState(() {
                                controller.changeRecieveCoin(
                                    crypto, formKey, convertController.text);
                              });
                              Navigator.pop(context);
                            },
                            title: Text(
                              crypto.symbol.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(crypto.name),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
              asset: controller.cryptoConverted,
            ),
          ],
        ),
        CoinTextField(
          formKey: formKey,
          controller: convertController,
          asset: controller.asset,
          onChanged: (value) {
            controller.buttonValidation(formKey);
            controller.convertedValue(value);
            setState(() {
              controller.assetHelper = dp(value);
            });
          },
          validator: (value) {
            if (value == '' || value == null || double.tryParse(value) == 0) {
              return CoreStrings.of(context)!.validatorReturnOne;
            } else if (!controller.validCoinValue(value)) {
              return CoreStrings.of(context)!.validatorReturnTwo;
            } else if (dp(controller.coinRegExp(value)) >
                controller.coinAmmount) {
              return CoreStrings.of(context)!.validatorReturnThree;
            }
            return null;
          },
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
