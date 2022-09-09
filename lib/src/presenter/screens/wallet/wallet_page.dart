import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/currency_formater.dart';
import '../../../domain/entities/asset_model.dart';
import '../../provider/user_provider.dart';
import '../../provider/visible_provider.dart';

class WalletScreen extends StatefulHookConsumerWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  int index = 1;
  void changeIndex(int value) {
    index = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider.state);
    var visible = ref.watch(visibleProvider.state);
    user.state.balance = user.state.increaseBalance(user.state.assets);
    String balance = formatter.format(user.state.balance);
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
                  visible.state ? balance : '*****',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.045),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: user.state.assets.length,
              itemBuilder: (context, index) {
                AssetModel asset = user.state.assets[index];
                String balance =
                    formatter.format(asset.coinBalance * asset.price);
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
                            visible.state ? balance : '*******',
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
                                  ? const Color.fromRGBO(214, 255, 223, 1)
                                  : const Color.fromRGBO(252, 228, 228, 1),
                            ),
                            child: Text(
                              '${variation ? '+' : ''} ${asset.variation}%',
                              style: TextStyle(
                                color: variation
                                    ? const Color.fromRGBO(12, 95, 44, 1)
                                    : const Color.fromRGBO(154, 20, 20, 1),
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: changeIndex,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/warren_logo.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Carteiras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: 'Movimentações',
          ),
        ],
      ),
    );
  }
}
