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
        color: AppAssets.magenta,
        size: 25,
      ),
      onPressed: widget.onPressed,
      // onPressed: () {
      //   CryptoEntity temp = widget.asset;
      //   setState(() {
      //     widget.asset = cryptoConverted;
      //     cryptoConverted = temp;
      //     widget.coinAmmount = dp(ref
      //         .read(coinAmmountProvider)[
      //             data.indexOf(widget.asset as CryptoViewData)]
      //         .toString());
      //   });
      //   convertController.clear();
      //   buttonValidation();
      //   convertedValue('0.0');
      // },
    );
  }
}
