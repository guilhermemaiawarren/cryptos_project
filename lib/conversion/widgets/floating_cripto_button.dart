import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/provider/controller_provider.dart';

import '../../shared/templates/app_assets.dart';

class FloatingCriptoButton extends ConsumerWidget {
  const FloatingCriptoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(convertControllerProvider);
    controller.addListener(() {});
    return FloatingActionButton(
      backgroundColor: controller.validate ? AppAssets.magenta : Colors.grey,
      onPressed: () {
        if (controller.validate) {
          controller.controllerNavigate(context);
        }
      },
      child: const Icon(
        Icons.keyboard_arrow_right,
        key: Key('FloatingIconKey'),
      ),
    );
  }
}
