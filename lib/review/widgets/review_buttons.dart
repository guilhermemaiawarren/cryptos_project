import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/core_strings.dart';
import '../../shared/common_model/move_model.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/templates/warren_button.dart';
import '../../shared/user/movements_provider.dart';
import '../../shared/user/user_coin_ammount_provider.dart';
import '../../shared/utils/decimal_to_double.dart';

class ReviewButtons extends ConsumerStatefulWidget {
  const ReviewButtons({
    Key? key,
    required this.convertId,
    required this.recieveId,
    required this.convert,
    required this.recieve,
    required this.move,
  }) : super(key: key);
  final int convertId;
  final int recieveId;
  final Decimal convert;
  final Decimal recieve;
  final MoveModel move;
  @override
  ConsumerState<ReviewButtons> createState() => _ReviewButtonsState();
}

class _ReviewButtonsState extends ConsumerState<ReviewButtons> {
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
              onPressed: () {
                setState(() {
                  ref.read(userCoinAmmountProvider)[widget.convertId] -=
                      dtd(widget.convert);
                  ref.read(userCoinAmmountProvider)[widget.recieveId] +=
                      dtd(widget.recieve);
                  ref.read(movementsProvider.state).state.add(widget.move);
                });
                Navigator.pushReplacementNamed(
                  context,
                  '/success',
                  arguments: widget.move,
                );
              },
              text: CoreStrings.of(context)!.conclude,
              color: AppAssets.magenta,
            ),
          ),
        ],
      ),
    );
  }
}
