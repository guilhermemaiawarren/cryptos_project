import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utils/currency_formater.dart';
import '../../../../domain/entities/asset_model.dart';
import '../../../provider/assets_provider.dart';
import '../../../provider/visible_provider.dart';

class WalletVisibility extends StatefulHookConsumerWidget {
  const WalletVisibility({Key? key}) : super(key: key);
  @override
  ConsumerState<WalletVisibility> createState() => _WalletVisibilityState();
}

class _WalletVisibilityState extends ConsumerState<WalletVisibility> {
  String walletBalanceFormatter(List<AssetModel> list) {
    double balance = 0.0;
    for (AssetModel model in assets) {
      balance += model.coinBalance * model.price;
    }
    return realFormatter.format(balance);
  }

  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibleProvider.state);
    String walletBalance = walletBalanceFormatter(assets);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Cripto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.3,
                  fontSize: 32,
                  color: Color.fromRGBO(224, 43, 87, 1),
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
                  walletBalance,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Montserrat'
                  ),
                )
              : Container(
                  width: 240,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
          const SizedBox(height: 10),
          Text(
            'Valor total de moedas',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
