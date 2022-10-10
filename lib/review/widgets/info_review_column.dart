import 'package:flutter/material.dart';
import '../../l10n/core_strings.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Divider(thickness: 1),
        DefaultInfoRow(label: CoreStrings.of(context)!.convert, text: convert),
        const Divider(thickness: 1),
        DefaultInfoRow(label: CoreStrings.of(context)!.recieve, text: recieve),
        const Divider(thickness: 1),
        DefaultInfoRow(label: CoreStrings.of(context)!.exchange, text: cambio),
      ],
    );
  }
}
