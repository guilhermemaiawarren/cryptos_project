import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/asset_model.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({
    Key? key,
    required this.asset,
    required this.visible,
    required this.balance,
    required this.variation,
  }) : super(key: key);

  final AssetModel asset;
  final StateController<bool> visible;
  final String balance;
  final bool variation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
            'R\$ ${visible.state ? balance : '*******'}',
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
    );
  }
}
