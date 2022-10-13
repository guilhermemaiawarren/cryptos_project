import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';

import '../../shared/common_model/crypto.dart';
import '../../shared/templates/app_assets.dart';

class TotalConvertValueContainer extends StatelessWidget {
  const TotalConvertValueContainer({
    Key? key,
    required this.convertedCryptoHelper,
    required this.cryptoConverted,
  }) : super(key: key);

  final Decimal convertedCryptoHelper;
  final CryptoEntity cryptoConverted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Column(
            key: const Key('EstimatedTotalColumn'),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CoreStrings.of(context)!.estimatedTotal,
                key: const Key('EstimatedTotalText'),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppAssets.montSerrat,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${convertedCryptoHelper.toStringAsFixed(7)} ${cryptoConverted.symbol.toUpperCase()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
