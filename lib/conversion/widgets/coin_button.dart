import 'package:flutter/material.dart';

import 'package:projeto_criptos/conversion/controller/conversion_controller.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import '../logicholder/methods/show_modal_bottom_sheet_cryptos.dart';

class CoinButton extends StatefulWidget {
  const CoinButton({
    Key? key,
    required this.value,
    required this.formKey,
    required this.id,
    required this.controller,
    required this.asset,
  }) : super(key: key);
  final String value;
  final GlobalKey<FormState> formKey;
  final String id;
  final ConversionController controller;
  final CryptoViewData asset;
  @override
  State<CoinButton> createState() => _CoinButtonState();
}

class _CoinButtonState extends State<CoinButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: () {
        showModalBottomSheetCryptos(
          context,
          widget.controller.cryptos,
          ListView(
            scrollDirection: Axis.vertical,
            key: const Key('ListViewCoinButton'),
            children: widget.controller.cryptos.map((crypto) {
              return Column(
                key: const Key('ColumnCoinButton'),
                children: [
                  const Divider(
                    thickness: 1,
                    key: Key('DividerCoinButton'),
                  ),
                  ListTile(
                    key: Key(crypto.id),
                    onTap: () {
                      setState(() {
                        if (widget.id == '1') {
                          widget.controller.changeConvertedCoin(
                            crypto,
                            widget.value,
                            widget.formKey,
                          );
                        } else {
                          widget.controller.changeRecieveCoin(
                            crypto,
                            widget.formKey,
                            widget.value,
                          );
                        }
                      });
                      Navigator.pop(context);
                    },
                    title: Text(
                      crypto.symbol.toUpperCase(),
                      key: const Key('SymbolCryptoCoinButton'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      crypto.name,
                      key: const Key('NameCryptoCoinButton'),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      key: Key('IconCoinButton'),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 9,
            backgroundColor: Colors.transparent,
            backgroundImage: Image.network(widget.asset.image).image,
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
    );
  }
}
