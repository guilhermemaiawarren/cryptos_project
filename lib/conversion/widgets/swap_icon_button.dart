import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/app_assets.dart';
import '../controller/conversion_controller.dart';
import '../provider/text_editing_controller_provider.dart';

class SwapIconButton extends ConsumerStatefulWidget {
  const SwapIconButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ConversionController controller;
  @override
  ConsumerState<SwapIconButton> createState() => _SwapIconButtonState();
}

class _SwapIconButtonState extends ConsumerState<SwapIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.sync_alt,
        key: const Key('SwapIcon'),
        color: AppAssets.magenta,
        size: 25,
      ),
      onPressed: () {
        setState(() {
          widget.controller.swapCoins();
            ref.read(textEditingControllerProvider.state).state.clear();
        });
      },
    );
  }
}
