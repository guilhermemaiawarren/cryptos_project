import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/controller/converted_crypto_provider.dart';
import 'package:projeto_criptos/details/controller/coin_ammount_provider.dart';
import 'package:projeto_criptos/portfolio/controller/cryptos_provider.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';
import 'package:projeto_criptos/shared/templates/error_body.dart';
import 'package:projeto_criptos/shared/templates/loading_body.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/utils/currency_formater.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';

import '../../shared/utils/decimal_parse.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  ConversionScreen({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  static const route = '/conversion';
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
      validate = formKey.currentState!.validate() ? true : false;
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
          cryptoConverted =
              data[0].id == widget.asset.id 
                  ? data[1]
                  : data[0];
        }
        return Scaffold(
          appBar: const ModelAppBar(text: 'Converter'),
          body: Column(
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
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  child: Text(
                                    'Escolha uma moeda para converter',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppAssets.montSerrat,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    children: data.map((crypto) {
                                      int index = data.indexOf(crypto);
                                      return Column(
                                        children: [
                                          const Divider(thickness: 1),
                                          ListTile(
                                            onTap: () {
                                              setState(() {
                                                cryptoConverted = widget.asset;
                                                widget.asset = crypto;
                                                widget.coinAmmount = dp(ref
                                                    .read(coinAmmountProvider)[
                                                        index]
                                                    .toString());
                                              });
                                              convertController.clear();
                                              buttonValidation();
                                              convertedValue('0');
                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                                crypto.symbol.toUpperCase()),
                                            subtitle: Text(crypto.name),
                                            trailing: const Icon(
                                                Icons.keyboard_arrow_right),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
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
                  IconButton(
                    icon: Icon(
                      Icons.sync_alt,
                      color: AppAssets.magenta,
                      size: 25,
                    ),
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
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  child: Text(
                                    'Escolha uma moeda para converter',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppAssets.montSerrat,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    children: data.map((crypto) {
                                      return Column(
                                        children: [
                                          const Divider(thickness: 1),
                                          ListTile(
                                            onTap: () {
                                              CryptoEntity temp =
                                                  cryptoConverted;
                                              setState(() {
                                                cryptoConverted = crypto;
                                                if (cryptoConverted.id ==
                                                    widget.asset.id) {
                                                  widget.asset = temp;
                                                }
                                              });
                                              convertController.clear();
                                              buttonValidation();
                                              convertedValue('0');
                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                                crypto.symbol.toUpperCase()),
                                            subtitle: Text(crypto.name),
                                            trailing: const Icon(
                                                Icons.keyboard_arrow_right),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
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
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
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
                        },
                        onChanged: (value) {
                          convertedValue(value);
                        },
                        validator: (value) {
                          if (value == '' || value == null) {
                            return 'Valor não pode ser igual a 0';
                          } else if (validCoinValue(value)) {
                            return 'O valor inicial não pode ser um caractere especial';
                          } else if (dp(coinRegExp(value)) >
                              widget.coinAmmount) {
                            return 'Valor não pode ser maior do que o disponível na carteira';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
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
