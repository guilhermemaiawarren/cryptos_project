import 'package:flutter/material.dart';

import '../../shared/templates/default_info_row.dart';

class InfoReviewColumn extends StatelessWidget {
  const InfoReviewColumn({
    Key? key,
    required this.convert,
    required this.recieve,
    required this.cambio,
  }) : super(key: key);

  final String convert;
  final String recieve;
  final String cambio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Divider(thickness: 1),
          DefaultInfoRow(label: 'Converter', text: convert),
          const Divider(thickness: 1),
          DefaultInfoRow(label: 'Receber', text: recieve),
          const Divider(thickness: 1),
          DefaultInfoRow(label: 'Câmbio', text: cambio),
        ],
      ),
    );
  }
}
