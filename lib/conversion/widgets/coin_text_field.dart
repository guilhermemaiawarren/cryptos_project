import 'package:flutter/material.dart';

import '../../shared/common_model/crypto.dart';

class CoinTextField extends StatefulWidget {
  const CoinTextField({
    Key? key,
    this.onFieldSubmitted,
    this.onChanged,
    required this.controller,
    required this.asset,
    this.validator,
    required this.formKey,
  }) : super(key: key);
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final CryptoEntity asset;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  @override
  State<CoinTextField> createState() => _CoinTextFieldState();
}

class _CoinTextFieldState extends State<CoinTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: '${widget.asset.symbol.toUpperCase()} 0.00',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
              ),
              keyboardType: TextInputType.number,
              onFieldSubmitted: widget.onFieldSubmitted,
              onChanged: widget.onChanged,
              validator: widget.validator,
            ),
          ],
        ),
      ),
    );
  }
}
