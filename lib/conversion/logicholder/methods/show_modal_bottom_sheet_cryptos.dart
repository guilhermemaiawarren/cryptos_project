import 'package:flutter/material.dart';

import '../../../shared/templates/app_assets.dart';

Future<void> showModalBottomSheetCryptos(
  BuildContext context,
  Widget child,
) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
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
              child: child,
            ),
          ],
        ),
      );
    },
  );
}
