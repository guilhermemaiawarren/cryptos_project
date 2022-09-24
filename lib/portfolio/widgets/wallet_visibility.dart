import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/balance_provider.dart';
import '../controller/visible_provider.dart';
import 'visibility_off_container.dart';

class WalletVisibility extends StatefulHookConsumerWidget {
  const WalletVisibility({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletVisibility> createState() => _WalletVisibilityState();
}

class _WalletVisibilityState extends ConsumerState<WalletVisibility> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibleProvider.state);
    Decimal balance = ref.watch(balanceProvider);

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
                  currencyFormatter.format(dtd(balance)),
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
