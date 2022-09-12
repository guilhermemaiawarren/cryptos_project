import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/currency_formater.dart';
import '../../../domain/entities/asset.dart';
import '../../provider/assets_provider.dart';
import '../../provider/visible_provider.dart';

class WalletScreen extends StatefulHookConsumerWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  String walletBalanceFormatter() {
    double balance = 0.0;
    for (AssetEntity model in assets) {
      balance += model.coinBalance * model.price;
    }
    return realFormatter.format(balance);
  }

  int index = 0;
  void changeIndex(int value) {
    index = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final assets = ref.watch(assetsProvider);
    var visible = ref.watch(visibleProvider.state);
    String walletBalance = walletBalanceFormatter();
    return Scaffold(
      body: Column(
        children: [
          Padding(
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
                            fontFamily: 'Montserrat'),
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
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              itemCount: assets.length,
              itemBuilder: (context, index) {
                AssetEntity asset = assets[index];
                return Column(
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 0.5,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage: Image.asset(asset.icon).image,
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text(asset.symbol)),
                          visible.state
                              ? Text(
                                  realFormatter
                                      .format(asset.coinBalance * asset.price),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                )
                              : Container(
                                  width: 110,
                                  height: 18,
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
                            asset.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const Spacer(),
                          visible.state
                              ? Text(
                                  "${asset.coinBalance.toString()} ${asset.symbol}")
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
        onTap: changeIndex,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/warren_logo.png'),
            ),
            label: 'Portfólio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/cents.png'),
            ),
            label: 'Movimentações',
          ),
        ],
      ),
    );
  }
}
