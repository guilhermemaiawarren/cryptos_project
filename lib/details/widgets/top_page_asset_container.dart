import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/details_asset_provider.dart';
import '../../shared/models/asset_model.dart';

import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';

class TopPageAssetContainer extends HookConsumerWidget {
  const TopPageAssetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AssetModel model = ref.read(detailsAssetProvider.notifier).state;
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(47, 47, 51, 1),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: Image.asset(model.icon).image,
              ),
            ],
          ),
          Text(model.symbol),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              currencyFormatter.format(
                dtd(model.currentPrice),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(47, 47, 51, 1),
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
