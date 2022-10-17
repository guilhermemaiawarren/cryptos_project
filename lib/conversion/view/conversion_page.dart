import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/utils/arguments/conversion_arguments.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/model_app_bar.dart';
import '../provider/controller_provider.dart';
import '../widgets/floating_cripto_button.dart';
import 'conversion_screen.dart';

class ConversionPage extends ConsumerStatefulWidget {
  const ConversionPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);
  static const route = '/conversion';

  final ConversionArguments arguments;

  @override
  ConsumerState<ConversionPage> createState() => _$ConversionPageState();
}

class _$ConversionPageState extends ConsumerState<ConversionPage> {
  @override
  Widget build(BuildContext context) {
    ref.read(convertControllerProvider.notifier).controllerInit(
          widget.arguments.crypto,
          widget.arguments.cryptoAmmount,
          widget.arguments.data,
          widget.arguments.coinAmmountList,
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
