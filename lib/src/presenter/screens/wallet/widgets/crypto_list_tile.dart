import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/asset_model.dart';
import '../../../provider/visible_provider.dart';

class CryptoListTile extends HookConsumerWidget {
  const CryptoListTile({
    Key? key,
    required this.asset,
    required this.balance,
    required this.variation,
  }) : super(key: key);

  final AssetModel asset;
  final String balance;
  final bool variation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool visible = ref.watch(visibleProvider);
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
            visible ? balance : '*******',
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
    );
  }
}
