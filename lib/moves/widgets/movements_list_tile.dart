import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:projeto_criptos/moves/model/movement_model.dart';
import 'package:projeto_criptos/shared/utils/currency_formater.dart';

import '../../shared/utils/decimal_to_double.dart';

class MovementListTile extends StatelessWidget {
  MovementListTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MovementModel model;

  final dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${model.convert.toStringAsFixed(5)} ${model.convertCoinId}'),
          Text('${model.recieve.toStringAsFixed(5)} ${model.recieveCoinId}'),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dateFormat.format(model.data)),
           Text(currencyFormatter.format(dtd(model.cashHelper))),
        ],
      ),
    );
  }
}
