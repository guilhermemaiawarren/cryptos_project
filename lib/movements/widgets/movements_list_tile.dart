

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/common_model/move_model.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';

class MovementListTile extends StatelessWidget {
  const MovementListTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MoveModel model;

  @override
  Widget build(BuildContext context) {
  final dateFormat = DateFormat.yMd(Platform.localeName);
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${model.convert.toStringAsFixed(4)} ${model.convertCoinId.toUpperCase()}', key: const Key('Convert'),),
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
