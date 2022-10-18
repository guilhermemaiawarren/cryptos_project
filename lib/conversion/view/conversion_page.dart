import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projeto_criptos/shared/utils/arguments/conversion_arguments.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/model_app_bar.dart';
import '../provider/controller_provider.dart';
import '../widgets/floating_cripto_button.dart';
import 'conversion_screen.dart';

class ConversionPage extends ConsumerWidget {
  const ConversionPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);
  static const route = '/conversion';

  final ConversionArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(convertControllerProvider.notifier).controllerInit(
          arguments.crypto,
          arguments.cryptoAmmount,
          arguments.data,
          arguments.coinAmmountList,
        );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ModelAppBar(
        text: CoreStrings.of(context)!.convert,
      ),
      body: ConversionScreen(
        controller: ref.read(convertControllerProvider),
      ),
      floatingActionButton: const FloatingCriptoButton(),
    );
  }
}
