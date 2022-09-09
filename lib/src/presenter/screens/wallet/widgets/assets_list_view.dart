import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/src/presenter/riverpod/user_provider.dart';
import 'package:projeto_criptos/src/presenter/riverpod/visible_provider.dart';

import '../../../../domain/entities/asset_model.dart';

class AssetsListView extends HookConsumerWidget {
  const AssetsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.state);
    final visible = ref.watch(visibleProvider.state);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: user.state.assets.length,
        itemBuilder: (context, index) {
          AssetModel asset = user.state.assets[index];
          double cryptoBalance = asset.coinBalance * asset.price;
          bool variation = asset.variation > 0;
          return Column(
            children: [
              const Divider(thickness: 1),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade800,
                  child: Icon(
                    asset.icon,
                    color: Colors.white,
                  ),
                ),
                title: Text(asset.symbol),
                subtitle: Text(
                  asset.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'R\$ ${visible.state ? cryptoBalance.toStringAsFixed(2) : '*******'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: variation
                            ? const Color.fromARGB(255, 134, 249, 230)
                            : Colors.red.shade100,
                      ),
                      child: Text(
                        '${variation ? '+' : ''} ${asset.variation}%',
                        style: TextStyle(
                          color: variation
                              ? const Color.fromARGB(255, 47, 129, 116)
                              : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
