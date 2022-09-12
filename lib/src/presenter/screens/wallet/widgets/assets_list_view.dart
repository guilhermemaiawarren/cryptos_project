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
      child: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Divider(thickness: 1),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: Image.asset(assets[index].icon).image,
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Text(assets[index].symbol)),
                    visible.state
                        ? Text(
                            visible.state
                                ? realFormatter.format(
                                    assets[index].coinBalance * assets[index].price)
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
                    const SizedBox(width: 10),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      assets[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Spacer(),
                    visible.state
                        ? Text(
                            visible.state
                                ? "${assets[index].coinBalance.toString()} ${assets[index].symbol}"
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
                    const SizedBox(width: 35),
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
