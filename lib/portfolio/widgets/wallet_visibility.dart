import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/widgets/visibility_off_container.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/templates/app_assets.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_parse.dart';
import '../../shared/utils/decimal_to_double.dart';
import '../controller/assets_provider.dart';
import '../controller/visible_provider.dart';

class WalletVisibility extends StatefulHookConsumerWidget {
  const WalletVisibility({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletVisibility> createState() => _WalletVisibilityState();
}

class _WalletVisibilityState extends ConsumerState<WalletVisibility> {
  @override
  void initState() {
    super.initState();
    ref.read(assetsProvider.notifier).getAllAssets();
  }

  String walletBalanceFormatter() {
    Decimal balance = dp('0.0');
    for (AssetModel model in ref.watch(assetsProvider.notifier).state) {
      balance += model.coinBalance * model.currentPrice;
    }
    return currencyFormatter.format(dtd(balance));
  }

  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibleProvider.state);
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cripto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppAssets.montSerrat,
                  letterSpacing: 0.3,
                  fontSize: 32,
                  color: AppAssets.magenta,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    visible.state = !visible.state;
                  });
                },
                icon: Icon(
                  visible.state ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
          visible.state
              ? Text(
                  walletBalanceFormatter(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: AppAssets.montSerrat,
                  ),
                )
              : const VisibilityOffContainer(
                  witdh: 240,
                  height: 37,
                ),
          const SizedBox(height: 5),
          Text(
            'Valor total de moedas',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
