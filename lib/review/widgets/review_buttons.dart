import 'package:flutter/material.dart';

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
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancelar',
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
              onPressed: onPressed,
              text: 'Concluir',
              color: AppAssets.magenta,
            ),
          ),
        ],
      ),
    );
  }
}
