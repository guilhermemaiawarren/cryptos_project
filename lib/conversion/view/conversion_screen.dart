import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/controller/controller_arguments.dart';
import 'package:projeto_criptos/conversion/widgets/total_convert_value_container.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import '../../shared/user/user_coin_ammount_provider.dart';
import '../controller/converted_crypto_provider.dart';
import '../controller/validate_provider.dart';
import '../logicholder/methods/conversion_methods.dart';
import '../widgets/available_balance_container.dart';
import '../widgets/coin_button.dart';
import '../widgets/coin_text_field.dart';
import '../widgets/swap_icon_button.dart';
import '../../portfolio/controller/cryptos_provider.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';

import '../../shared/utils/decimal_parse.dart';
import '../logicholder/methods/show_modal_bottom_sheet_cryptos.dart';
import '../widgets/helper_currency_text.dart';
import '../widgets/informative_text.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  const ConversionScreen({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  final Decimal coinAmmount;
  final CryptoEntity asset;

  @override
  ConsumerState<ConversionScreen> createState() => _$ConversionScreenState();
}

class _$ConversionScreenState extends ConsumerState<ConversionScreen> {
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
    final cryptos = ref.watch(cryptosProvider);
    final controller = ref.watch(controllerArgumentsProvider.state).state;
    controller.convertCoin = asset;
    controller.recieveCoin = cryptoConverted;
    return cryptos.when(
      data: (data) {
        if (cryptoConverted.id == 'id') {
          cryptoConverted = data[0].id == asset.id ? data[1] : data[0];
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvailableBalanceContainer(
              asset: asset,
              coinAmmount: coinAmmount,
            ),
            const InformativeText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CoinButton(
                  data: data,
                  onPressed: () {
                    showModalBottomSheetCryptos(
                      context,
                      data,
                      ListView(
                        children: data.map((crypto) {
                          int index = data.indexOf(crypto);
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
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
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
                  onPressed: () {
                    CryptoEntity temp = asset;
                    setState(() {
                      asset = cryptoConverted;
                      controller.convertCoin = asset;
                      cryptoConverted = temp;
                      controller.recieveCoin = cryptoConverted;
                      coinAmmount = dp(ref
                          .read(userCoinAmmountProvider)[
                              data.indexOf(asset as CryptoViewData)]
                          .toString());
                    });
                    convertController.clear();
                    buttonValidation();
                    convertedValue('0.0');
                  },
                ),
                CoinButton(
                  data: data,
                  onPressed: () {
                    showModalBottomSheetCryptos(
                      context,
                      data,
                      ListView(
                        children: data.map((crypto) {
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
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
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
                if (value == '' ||
                    value == null ||
                    double.tryParse(value) == 0) {
                  return 'Valor deve ser maior que zero';
                } else if (ConversionMethods.validCoinValue(value)) {
                  return CoreStrings.of(context)!.validatorReturnTwo;
                } else if (dp(ConversionMethods.coinRegExp(value)) >
                    coinAmmount) {
                  return CoreStrings.of(context)!.validatorReturnThree;
                }
                return null;
              },
            ),
            HelperCurrencyText(convertHelper: convertHelper),
            TotalConvertValueContainer(
              convertedCryptoHelper: convertedCryptoHelper,
              cryptoConverted: cryptoConverted,
            ),
          ],
        );
      },
      error: (e, s) {
        return ErrorBody(
          onRetry: () {
            ref.refresh(cryptosProvider);
          },
        );
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }
}
