import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';

class HelperCurrencyText extends StatelessWidget {
  const HelperCurrencyText({
    Key? key,
    required this.convertHelper,
  }) : super(key: key);

  final Decimal convertHelper;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Text(
        currencyFormatter.format(dtd(convertHelper)),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
    );
  }
}
