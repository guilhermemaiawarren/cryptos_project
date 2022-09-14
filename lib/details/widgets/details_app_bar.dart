import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/variation_provider.dart';
import '../controller/x_axis_provider.dart';

class DetailsAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const DetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
          ref.read(xAxisProvider.state).state = 5;
          ref.read(rangeVariationProvider.state).state = 24;
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      title: const Text(
        'Detalhes',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
