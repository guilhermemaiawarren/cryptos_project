import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModelAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const ModelAppBar({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),
        color: Theme.of(context).appBarTheme.iconTheme!.color,
      ),
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
