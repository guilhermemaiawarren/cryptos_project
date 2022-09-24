import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ModelAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const ModelAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);
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
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: const TextStyle(
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
