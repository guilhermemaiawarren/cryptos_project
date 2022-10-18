import 'package:flutter/material.dart';

import '../../l10n/core_strings.dart';

class InformativeText extends StatelessWidget {
  const InformativeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Text(
        CoreStrings.of(context)!.textConvert,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
