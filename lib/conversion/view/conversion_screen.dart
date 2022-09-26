import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/controller/to_be_converted_crypto_provider.dart';
import 'package:projeto_criptos/portfolio/controller/cryptos_provider.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';
import 'package:projeto_criptos/shared/templates/error_body.dart';
import 'package:projeto_criptos/shared/templates/loading_body.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/utils/currency_formater.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';

import '../../shared/utils/decimal_parse.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  const ConversionScreen({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  static const route = '/conversion';
  final Decimal coinAmmount;
  final CryptoEntity asset;

  @override
  ConsumerState<ConversionScreen> createState() => _$ConversionScreenState();
}

class _$ConversionScreenState extends ConsumerState<ConversionScreen> {
  final TextEditingController convertController = TextEditingController();
  bool validate = false;
  late CryptoEntity cryptoConverted;

  final formKey = GlobalKey<FormState>();

  buttonValidation() {
    setState(() {
      validate = formKey.currentState!.validate() ? true : false;
    });
  }

  Decimal convertHelper = dp('0.0');
  Decimal convertedCryptoHelper = dp('0.00000');

  convertedValue(String value) {
    setState(() {
      convertHelper = dp(value) * widget.asset.currentPrice;
      convertedCryptoHelper = dp((convertHelper.toDouble() / cryptoConverted.currentPrice.toDouble()).toString());
    });
  }

  @override
  void initState() {
    super.initState();
    convertController.addListener(buttonValidation);
  }

  @override
  Widget build(BuildContext context) {
    final cryptos = ref.watch(cryptosProvider);
    cryptoConverted = ref.watch(convertedCrypto.state).state;
    return cryptos.when(
      data: (data) {
        cryptoConverted = data[1].id == widget.asset.id ? data[0] : data[1];
        return Scaffold(
          appBar: const ModelAppBar(text: 'Converter'),
          body: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Saldo Disponível',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: AppAssets.montSerrat,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${widget.coinAmmount.toStringAsFixed(4)} ${widget.asset.symbol.toUpperCase()}',
                        style: TextStyle(
                          fontFamily: AppAssets.montSerrat,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Text(
                    'Quanto você gostaria de converter?',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: AppAssets.montSerrat,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                Image.network(widget.asset.image).image,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(widget.asset.symbol.toUpperCase()),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.sync_alt,
                      color: AppAssets.magenta,
                      size: 25,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                Image.network(cryptoConverted.image).image,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(cryptoConverted.symbol.toUpperCase()),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: convertController,
                    decoration: InputDecoration(
                      hintText: '${widget.asset.symbol.toUpperCase()} 0.00',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (value) {
                      buttonValidation();
                      convertedValue(value);
                    },
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Valor não pode ser igual a 0';
                      } else if (double.parse(convertController.text
                              .replaceAll(RegExp(r'[^\w\s]+'), '.')) >
                          widget.coinAmmount.toDouble()) {
                        return 'Valor não pode ser maior do que o disponível na carteira';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    currencyFormatter.format(dtd(convertHelper)),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total estimado',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppAssets.montSerrat,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${convertedCryptoHelper.toStringAsFixed(7)} ${cryptoConverted.symbol.toUpperCase()}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: validate ? AppAssets.magenta : Colors.grey,
            onPressed: validate ? () {} : null,
            child: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        );
      },
      error: (e, s) {
        return ErrorBody(
          onError: () {
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
