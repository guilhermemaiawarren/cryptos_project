import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/src/presenter/riverpod/user_provider.dart';
import 'package:projeto_criptos/src/presenter/riverpod/visible_provider.dart';

import '../../../../../utils/currency_formater.dart';

class WalletVisibility extends StatefulHookConsumerWidget {
  const WalletVisibility({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletVisibility> createState() => _WalletVisibilityState();
}

class _WalletVisibilityState extends ConsumerState<WalletVisibility> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider.state);
    var visible = ref.watch(visibleProvider.state);
    user.state.balance = user.state.increaseBalance(user.state.assets);
    String balance = formatter.format(user.state.balance);
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
                'Carteira',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                  fontSize: 35,
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
          Text(
            visible.state
                ? 'R\$ $balance'
                : '*****',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
