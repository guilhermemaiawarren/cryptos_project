import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/app_assets.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';
import '../provider/balance_provider.dart';
import '../provider/visible_provider.dart';
import 'visibility_off_container.dart';

class WalletVisibility extends StatefulHookConsumerWidget {
  const WalletVisibility({Key? key}) : super(key: key);
  static const route = '/wallet';

  @override
  ConsumerState<WalletVisibility> createState() => _WalletVisibilityState();
}

class _WalletVisibilityState extends ConsumerState<WalletVisibility> {
  @override
  Widget build(BuildContext context) {
    StateController<bool> visible = ref.watch(visibleProvider.state);
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
                CoreStrings.of(context)!.crypto,
                key: const Key('Cripto'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppAssets.montSerrat,
                  letterSpacing: 0.3,
                  fontSize: 32,
                  color: AppAssets.magenta,
                ),
              ),
              IconButton(
                key: const Key('ChangeVisibility'),
                onPressed: () {
                  setState(
                    () {
                      visible.state = !visible.state;
                    },
                  );
                },
                icon: Icon(
                  visible.state ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
          visible.state
              ? Text(currencyFormatter.format(dtd(balance)),
                  style: Theme.of(context).textTheme.headlineSmall)
              : const VisibilityOffContainer(
                  witdh: 240,
                  height: 37,
                ),
          const SizedBox(height: 5),
          Text(
            CoreStrings.of(context)!.totalBalanceHelper,
            key: const Key('TotalBalanceHelper'),
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
