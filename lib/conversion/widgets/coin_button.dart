import 'package:flutter/material.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/common_model/crypto.dart';


class CoinButton extends StatefulWidget {
  const CoinButton({
    Key? key,
    required this.data,
    required this.onPressed,
    required this.asset,
  }) : super(key: key);
  final List<CryptoViewData> data;
  final void Function()? onPressed;
  final CryptoEntity asset;
  @override
  State<CoinButton> createState() => _CoinButtonState();
}

class _CoinButtonState extends State<CoinButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: widget.onPressed,
      child: Row(
        children: [
          CircleAvatar(
            radius: 9,
            backgroundColor: Colors.transparent,
            backgroundImage: Image.network(widget.asset.image).image,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Text(widget.asset.symbol.toUpperCase()),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}


