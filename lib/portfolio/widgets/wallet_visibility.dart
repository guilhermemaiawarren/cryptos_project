import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/controller/balance_provider.dart';
import 'package:projeto_criptos/portfolio/widgets/visibility_off_container.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/utils/currency_formater.dart';
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
    ref.read(assetsNotifierProvider.notifier).getAllAssets();
  }

  List<AssetModel> assets = [];

  @override
  Widget build(BuildContext context) {
    assets = ref.read(assetsNotifierProvider);
    var visible = ref.watch(visibleProvider.state);
    double balance = ref.watch(balanceProvider);

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
                  currencyFormatter.format(balance),
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
