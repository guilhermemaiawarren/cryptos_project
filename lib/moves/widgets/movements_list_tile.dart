import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:projeto_criptos/shared/utils/currency_formater.dart';

import '../../shared/common_model/move_model.dart';
import '../../shared/utils/decimal_to_double.dart';

class MovementListTile extends StatelessWidget {
  MovementListTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MoveModel model;

  final dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${model.convert.toStringAsFixed(4)} ${model.convertCoinId.toUpperCase()}'),
          Text('${model.recieve.toStringAsFixed(4)} ${model.recieveCoinId.toUpperCase()}'),
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
