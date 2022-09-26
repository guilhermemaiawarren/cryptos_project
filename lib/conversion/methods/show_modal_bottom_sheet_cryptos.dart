import 'package:flutter/material.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/templates/app_assets.dart';

Future<void> showModalBottomSheetCryptos(
    BuildContext context, List<CryptoViewData> data, Widget listView) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Text(
                'Escolha uma moeda para converter',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppAssets.montSerrat,
                ),
              ),
            ),
            Expanded(
              child: listView,
            ),
          ],
        ),
      );
    },
  );
}
