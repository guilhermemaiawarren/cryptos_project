import 'package:flutter/material.dart';

import '../../shared/templates/app_assets.dart';

class SwapIconButton extends StatefulWidget {
  const SwapIconButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  State<SwapIconButton> createState() => _SwapIconButtonState();
}

class _SwapIconButtonState extends State<SwapIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.sync_alt,
        key: const Key('SwapIcon'),
        color: AppAssets.magenta,
        size: 25,
      ),
      onPressed: widget.onPressed,
    );
  }
}
