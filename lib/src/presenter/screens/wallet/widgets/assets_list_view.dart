import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/src/presenter/provider/assets_provider.dart';
import 'package:projeto_criptos/src/presenter/provider/visible_provider.dart';

import '../../../../../utils/currency_formater.dart';

class AssetsListView extends StatefulHookConsumerWidget {
  const AssetsListView({Key? key}) : super(key: key);

  @override
  ConsumerState<AssetsListView> createState() => _AssetsListViewState();
}

class _AssetsListViewState extends ConsumerState<AssetsListView> {
  @override
  Widget build(BuildContext context) {
    final assets = ref.watch(assetsProvider);
    var visible = ref.watch(visibleProvider.state);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Divider(thickness: 1),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: Image.asset('assets/icons/btc.png').image,
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(assets[0].symbol),
                visible.state
                    ? Text(
                        visible.state
                            ? realFormatter
                                .format(assets[0].coinBalance * assets[0].price)
                            : '*******',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      )
                    : Container(
                        width: 80,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  assets[0].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                visible.state
                    ? Text(
                        visible.state
                            ? "${assets[0].coinBalance.toString()} ${assets[0].symbol}"
                            : "-------",
                      )
                    : Container(
                        width: 60,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
              ],
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: Image.asset('assets/icons/ethereum.png').image,
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(assets[1].symbol),
                visible.state
                    ? Text(
                        visible.state
                            ? realFormatter
                                .format(assets[1].coinBalance * assets[1].price)
                            : '*******',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      )
                    : Container(
                        width: 80,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  assets[1].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                visible.state
                    ? Text(
                        visible.state
                            ? "${assets[1].coinBalance.toString()} ${assets[1].symbol}"
                            : "-------",
                      )
                    : Container(
                        width: 60,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
              ],
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: Image.asset('assets/icons/litecoin.png').image,
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(assets[2].symbol),
                visible.state
                    ? Text(
                        visible.state
                            ? realFormatter
                                .format(assets[2].coinBalance * assets[2].price)
                            : '*******',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      )
                    : Container(
                        width: 80,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  assets[2].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                visible.state
                    ? Text(
                        visible.state
                            ? "${assets[2].coinBalance.toString()} ${assets[2].symbol}"
                            : "-------",
                      )
                    : Container(
                        width: 60,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
              ],
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
