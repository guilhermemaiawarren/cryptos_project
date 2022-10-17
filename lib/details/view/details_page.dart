import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/utils/arguments/details_arguments.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/model_app_bar.dart';
import '../provider/days_provider.dart';
import 'details_screen.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({
    super.key,
    required this.arguments,
  });
  static const route = '/details';
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(daysProvider.state).state = 5;
      },
    );
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
