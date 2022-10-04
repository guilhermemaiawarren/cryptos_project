import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import '../controller/get_price_provider.dart';
import '../../shared/common_model/crypto.dart';
import '../../shared/utils/arguments/to_details_arguments.dart';

import '../controller/days_provider.dart';
import '../../shared/templates/model_app_bar.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({
    Key? key,
    required this.asset,
    required this.coinAmmount,
  }) : super(key: key);
  static const route = '/details';

  final CryptoEntity asset;
  final Decimal coinAmmount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ToDetailsArguments;
    Future.delayed(Duration.zero, () {
      ref.read(daysProvider.state).state = 5;
      ref.read(getPriceProvider.state).state = '';
    });
    return Scaffold(
      appBar:  ModelAppBar(
        text: CoreStrings.of(context)!.details,
      ),
      body: DetailsScreen(
        coin: args.crypto,
        coinAmmount: args.coinAmmount,
      ),
    );
  }
}
