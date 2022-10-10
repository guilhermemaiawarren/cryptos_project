import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import '../../l10n/core_strings.dart';

import '../../shared/common_model/crypto.dart';

import '../../shared/templates/app_assets.dart';

class AvailableBalanceContainer extends StatelessWidget {
  const AvailableBalanceContainer({
    Key? key,
    required this.asset,
    required this.coinAmmount,
  }) : super(key: key);
  final CryptoEntity asset;
  final Decimal coinAmmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      color: Colors.grey.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            CoreStrings.of(context)!.availableBalance,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontFamily: AppAssets.montSerrat,
              fontSize: 16,
            ),
          ),
          Text(
            '${coinAmmount.toStringAsFixed(4)} ${asset.symbol.toUpperCase()}',
            style: TextStyle(
              fontFamily: AppAssets.montSerrat,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
