import 'package:flutter/material.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/templates/warren_button.dart';

class ReviewButtons extends StatelessWidget {
  const ReviewButtons({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Expanded(
            child: WarrenButton(
              key: const Key('BackButton'),
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: CoreStrings.of(context)!.cancel,
              borderSide: BorderSide(
                color: AppAssets.magenta,
              ),
              textColor: AppAssets.magenta,
              color: Colors.white,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Expanded(
            child: WarrenButton(
              key: const Key('PushButton'),
              onPressed: onPressed,
              text: CoreStrings.of(context)!.conclude,
              color: AppAssets.magenta,
            ),
          ),
        ],
      ),
    );
  }
}
