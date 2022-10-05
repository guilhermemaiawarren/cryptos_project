import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/utils/arguments/to_revision_arguments.dart';
import '../controller/controller_arguments.dart';
import '../controller/validate_provider.dart';

import '../../shared/templates/app_assets.dart';

class FloatingCriptoButton extends HookConsumerWidget {
  const FloatingCriptoButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool validate = ref.watch(validateProvider.state).state;
    final controller = ref.watch(controllerArgumentsProvider.state).state;
    return FloatingActionButton(
      backgroundColor: validate ? AppAssets.magenta : Colors.grey,
      onPressed: validate
          ? () {
              Navigator.pushNamed(
                context,
                '/revision',
                arguments: ToRevisionArguments(
                  convert: controller.convert,
                  recieve: controller.recieve,
                  convertCoin: controller.convertCoin,
                  recieveCoin: controller.recieveCoin,
                ),
              );
              ref.read(validateProvider.state).state = false;
            }
          : null,
      child: const Icon(
        Icons.keyboard_arrow_right,
        key: Key('FloatingIconKey'),
      ),
    );
  }
}
