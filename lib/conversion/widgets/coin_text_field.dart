import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/controller_provider.dart';

import '../../l10n/core_strings.dart';
import '../../shared/common_model/crypto.dart';
import '../../shared/utils/decimal_parse.dart';

class CoinTextField extends ConsumerStatefulWidget {
  const CoinTextField({
    Key? key,
    this.onChanged,
    required this.controller,
    required this.asset,
    this.validator,
    required this.formKey,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final CryptoEntity asset;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  @override
  ConsumerState<CoinTextField> createState() => _CoinTextFieldState();
}

class _CoinTextFieldState extends ConsumerState<CoinTextField> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(convertControllerProvider);
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
              key: const Key('CriptoFormField'),
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
              onChanged: (value) {
                if (double.tryParse(value) != null) {
                  controller.buttonValidation(widget.formKey);
                  controller.convertedValue(value);
                  controller.assetHelper = dp(value);
                  setState(() {});
                }
              },
              validator: (value) {
                if (value == '' ||
                    value == null ||
                    double.tryParse(value) == 0) {
                  return CoreStrings.of(context)!.validatorReturnOne;
                } else if (!controller.validCoinValue(value)) {
                  return CoreStrings.of(context)!.validatorReturnTwo;
                } else if (dp(controller.coinRegExp(value)) >
                    controller.coinAmmount) {
                  return CoreStrings.of(context)!.validatorReturnThree;
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,6}')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
