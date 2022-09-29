import 'package:flutter/material.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';

class BodyMoves extends StatelessWidget {
  const BodyMoves({
    Key? key,
  }) : super(key: key);
  static const route = '/bodyMoves';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 55,
        left: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 25,
            ),
            child: Text(
              'Movimentações',
              style: TextStyle(
                fontFamily: AppAssets.montSerrat,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Divider(thickness: 1),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('0.0000822 BTC'),
                          Text('0.0097 ETH'),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('11/04/2022'),
                          Text('R\$ 888,55'),
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
    );
  }
}
