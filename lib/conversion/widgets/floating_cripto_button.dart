import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/provider/controller_provider.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/utils/arguments/to_revision_arguments.dart';

class FloatingCriptoButton extends ConsumerWidget {
  const FloatingCriptoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(convertControllerProvider);
    controller.addListener(() {});
    return FloatingActionButton(
      backgroundColor: controller.validate ? AppAssets.magenta : Colors.grey,
      onPressed: () {
        if (controller.validate) {
          Navigator.pushNamed(
            context,
            '/revision',
            arguments: ToRevisionArguments(
              convert: controller.assetHelper,
              recieve: controller.convertedCryptoHelper,
              convertCoin: controller.asset,
              recieveCoin: controller.cryptoConverted,
            ),
          );
        }
      },
      child: const Icon(
        Icons.keyboard_arrow_right,
        key: Key('FloatingIconKey'),
      ),
    );
  }
}
