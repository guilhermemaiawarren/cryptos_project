import 'package:flutter/material.dart';
import 'package:projeto_criptos/shared/utils/arguments/details_arguments.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/model_app_bar.dart';
import 'details_screen.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.arguments,
  });
  static const route = '/details';
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModelAppBar(
        text: CoreStrings.of(context)!.details,
      ),
      body: DetailsScreen(
        coin: arguments.crypto,
        coinAmmount: arguments.coinAmmount,
      ),
    );
  }
}
