import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/provider/controller_provider.dart';

import '../../shared/common_model/crypto.dart';
import '../logicholder/methods/show_modal_bottom_sheet_cryptos.dart';

class CoinButton extends ConsumerStatefulWidget {
  const CoinButton({
    Key? key,
    required this.data,
    required this.asset,
    required this.value,
    required this.formKey,
    required this.id,
  }) : super(key: key);
  final List<CryptoEntity> data;
  final CryptoEntity asset;
  final String value;
  final GlobalKey<FormState> formKey;
  final String id;
  @override
  ConsumerState<CoinButton> createState() => _CoinButtonState();
}

class _CoinButtonState extends ConsumerState<CoinButton> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(convertControllerProvider);
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: () {
        showModalBottomSheetCryptos(
          context,
          controller.cryptos,
          ListView(
            key: const Key('ListViewCoinButton'),
            children: widget.data.map((crypto) {
              return Column(
                key: const Key('ColumnCoinButton'),
                children: [
                  const Divider(
                    thickness: 1,
                    key: Key('DividerCoinButton'),
                  ),
                  ListTile(
                    key: const Key('ListTileBottomSheet'),
                    onTap: () {
                      if (widget.id == '1') {
                        controller.changeConvertedCoin(
                          crypto,
                          widget.value,
                          widget.formKey,
                        );
                        setState(() {});
                      } else {
                        controller.changeRecieveCoin(
                          crypto,
                          widget.formKey,
                          widget.value,
                        );
                        setState(() {});
                      }
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
