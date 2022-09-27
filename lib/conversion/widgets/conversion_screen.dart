import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/converted_crypto_provider.dart';
import '../controller/validate_provider.dart';
import 'available_balance_container.dart';
import 'coin_button.dart';
import 'coin_text_field.dart';
import 'swap_icon_button.dart';
import '../../portfolio/controller/coin_ammount_provider.dart';
import '../../portfolio/controller/cryptos_provider.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/common_model/crypto.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';

import '../../shared/utils/decimal_parse.dart';
import '../methods/show_modal_bottom_sheet_cryptos.dart';
import '../widgets/helper_currency_text.dart';
import '../widgets/informative_text.dart';
import '../widgets/total_convert_value_container.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  ConversionScreen({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  Decimal coinAmmount;
  CryptoEntity asset;

  @override
  ConsumerState<ConversionScreen> createState() => _$ConversionScreenState();
}

class _$ConversionScreenState extends ConsumerState<ConversionScreen> {
  final TextEditingController convertController = TextEditingController();
  bool validate = false;
  late CryptoEntity cryptoConverted;

  final formKey = GlobalKey<FormState>();
  Decimal convertHelper = dp('0.0');
  Decimal convertedCryptoHelper = dp('0.00000');
  buttonValidation() {
    setState(() {
      ref.read(validateProvider.state).state =
          formKey.currentState!.validate() ? true : false;
    });
  }

  String coinRegExp(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  bool validCoinValue(String source) {
    return source.startsWith(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  convertedValue(String value) {
    setState(() {
      convertHelper = dp(coinRegExp(value)) * widget.asset.currentPrice;
      convertedCryptoHelper = dp(
          (convertHelper.toDouble() / cryptoConverted.currentPrice.toDouble())
              .toString());
    });
  }

  @override
  void initState() {
    super.initState();
    convertController.addListener(buttonValidation);
    cryptoConverted = ref.read(convertedCryptoProvider.state).state;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cryptos = ref.watch(cryptosProvider);
    return cryptos.when(
      data: (data) {
        if (cryptoConverted.id == 'id') {
          cryptoConverted = data[0].id == widget.asset.id ? data[1] : data[0];
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvailableBalanceContainer(
              asset: widget.asset,
              coinAmmount: widget.coinAmmount,
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
                                      cryptoConverted = widget.asset;
                                    }
                                    widget.asset = crypto;
                                    widget.coinAmmount = dp(ref
                                        .read(coinAmmountProvider)[index]
                                        .toString());
                                  });
                                  convertController.clear();
                                  buttonValidation();
                                  convertedValue('0');
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
                  asset: widget.asset,
                ),
                SwapIconButton(
                  onPressed: () {
                    CryptoEntity temp = widget.asset;
                    setState(() {
                      widget.asset = cryptoConverted;
                      cryptoConverted = temp;
                      widget.coinAmmount = dp(ref
                          .read(coinAmmountProvider)[
                              data.indexOf(widget.asset as CryptoViewData)]
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
                                    if (cryptoConverted.id == widget.asset.id) {
                                      widget.asset = temp;
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
              asset: widget.asset,
              onChanged: (value) {
                buttonValidation();
                convertedValue(value);
              },
              validator: (value) {
                if (value == '' || value == null || double.tryParse(value) == 0) {
                  return 'Valor deve ser maior que zero';
                } else if (validCoinValue(value)) {
                  return 'O valor inicial não pode ser um caractere especial';
                } else if (dp(coinRegExp(value)) > widget.coinAmmount) {
                  return 'Saldo Insuficiente';
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
