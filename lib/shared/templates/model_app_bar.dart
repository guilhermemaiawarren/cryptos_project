import 'package:flutter/material.dart';

class ModelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ModelAppBar({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
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
