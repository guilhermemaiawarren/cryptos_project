import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/arguments/to_details_arguments.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';
import '../model/crypto_view_data.dart';
import '../provider/visible_provider.dart';
import 'visibility_off_container.dart';

class AssetListTile extends ConsumerWidget {
  const AssetListTile({
    Key? key,
    required this.crypto,
    required this.cryptoBalance,
  }) : super(key: key);

  final CryptoViewData crypto;
  final Decimal cryptoBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibleProvider.state);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: ToDetailsArguments(
            crypto: crypto,
            coinAmmount: cryptoBalance,
          ),
        );
      },
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        backgroundImage: Image.network(
          crypto.image,
        ).image,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(crypto.symbol.toUpperCase())),
          visible.state
              ? Text(
                  currencyFormatter.format(
                    dtd(crypto.currentPrice),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                )
              : const VisibilityOffContainer(
                  witdh: 110,
                  height: 15,
                ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              crypto.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const Spacer(),
          visible.state
              ? Text(
                  "${cryptoBalance.toStringAsFixed(4)} ${crypto.symbol.toUpperCase()}")
              : const VisibilityOffContainer(
                  witdh: 60,
                  height: 15,
                ),
          const Padding(
            padding: EdgeInsets.only(left: 35),
          ),
        ],
      ),
    );
  }
}
