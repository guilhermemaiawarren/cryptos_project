import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_criptos/conversion/controller/validate_provider.dart';
import 'package:projeto_criptos/conversion/widgets/swap_icon_button.dart';
import 'package:projeto_criptos/conversion/widgets/total_convert_value_container.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import '../../l10n/core_strings.dart';
import '../../shared/common_model/crypto.dart';
import '../../shared/user/user_coin_ammount_provider.dart';
import '../../shared/utils/decimal_parse.dart';
import '../controller/controller_arguments.dart';
import '../controller/converted_crypto_provider.dart';
import '../logicholder/methods/conversion_methods.dart';
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
  late CryptoEntity cryptoConverted;
  late CryptoEntity asset;
  late Decimal coinAmmount;
  final formKey = GlobalKey<FormState>();
  Decimal convertHelper = dp('0.0');
  Decimal convertedCryptoHelper = dp('0.0');
  buttonValidation() {
    setState(() {
      ref.read(validateProvider.state).state =
          formKey.currentState!.validate() ? true : false;
    });
  }

  convertedValue(String value) {
    setState(() {
      convertHelper =
          dp(ConversionMethods.coinRegExp(value)) * asset.currentPrice;
      convertedCryptoHelper = dp(
          (convertHelper.toDouble() / cryptoConverted.currentPrice.toDouble())
              .toString());
    });
  }

  @override
  void initState() {
    super.initState();
    asset = widget.asset;
    coinAmmount = widget.coinAmmount;
    cryptoConverted = ref.read(convertedCryptoProvider.state).state;
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(controllerArgumentsProvider.state).state;
    controller.convertCoin = asset;
    controller.recieveCoin = cryptoConverted;
     if (cryptoConverted.id == 'id') {
          cryptoConverted = widget.data[0].id == asset.id ? widget.data[1] : widget.data[0];
        }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvailableBalanceContainer(
          asset: asset,
          coinAmmount: coinAmmount,
        ),
        const InformativeText(key: Key('InformativeText'),),
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
                      int index = widget.data.indexOf(crypto);
                      return Column(
                        children: [
                          const Divider(thickness: 1),
                          ListTile(
                            onTap: () {
                              setState(() {
                                if (cryptoConverted == crypto) {
                                  cryptoConverted = asset;
                                  controller.recieveCoin = cryptoConverted;
                                }
                                asset = crypto;
                                coinAmmount = dp(ref
                                    .read(userCoinAmmountProvider)[index]
                                    .toString());
                                controller.convertCoin = asset;
                              });
                              convertController.clear();
                              buttonValidation();
                              convertedValue('0');
                              Navigator.of(context).pop();
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
              asset: asset,
            ),
            SwapIconButton(
              key: const Key('SwapButton'),
              onPressed: () {
                CryptoEntity temp = asset;
                setState(() {
                  asset = cryptoConverted;
                  controller.convertCoin = asset;
                  cryptoConverted = temp;
                  controller.recieveCoin = cryptoConverted;
                  coinAmmount = dp(ref
                      .read(userCoinAmmountProvider)[
                          widget.data.indexOf(asset as CryptoViewData)]
                      .toString());
                });
                convertController.clear();
                buttonValidation();
                convertedValue('0.0');
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
                              CryptoEntity temp = cryptoConverted;
                              setState(() {
                                cryptoConverted = crypto;
                                controller.recieveCoin = cryptoConverted;
                                if (cryptoConverted.id == asset.id) {
                                  asset = temp;
                                  controller.convertCoin = asset;
                                }
                              });
                              buttonValidation();
                              convertedValue(convertController.text);
                              Navigator.of(context).pop();
                            },
                            title: Text(crypto.symbol.toUpperCase()),
                            subtitle: Text(crypto.name),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
              asset: cryptoConverted,
            ),
          ],
        ),
        CoinTextField(
          formKey: formKey,
          controller: convertController,
          asset: asset,
          onChanged: (value) {
            buttonValidation();
            convertedValue(value);
            controller.convert = dp(value);
            controller.recieve = convertedCryptoHelper;
          },
          validator: (value) {
            if (value == '' || value == null || double.tryParse(value) == 0) {
              return CoreStrings.of(context)!.validatorReturnOne;
            } else if (ConversionMethods.validCoinValue(value)) {
              return CoreStrings.of(context)!.validatorReturnTwo;
            } else if (dp(ConversionMethods.coinRegExp(value)) > coinAmmount) {
              return CoreStrings.of(context)!.validatorReturnThree;
            }
            return null;
          },
        ),
        HelperCurrencyText(convertHelper: convertHelper),
        Expanded(
          child: TotalConvertValueContainer(
            convertedCryptoHelper: convertedCryptoHelper,
            cryptoConverted: cryptoConverted,
          ),
        ),
      ],
    );
  }
}
