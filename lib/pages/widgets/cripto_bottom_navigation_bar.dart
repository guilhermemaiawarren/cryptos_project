import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/app_assets.dart';
import '../controller/page_index_provider.dart';

class CriptoBottomNavigationBar extends StatefulHookConsumerWidget {
  const CriptoBottomNavigationBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final void Function(int)? onTap;
  @override
  ConsumerState<CriptoBottomNavigationBar> createState() =>
      _CriptoBottomNavigationBarState();
}

class _CriptoBottomNavigationBarState
    extends ConsumerState<CriptoBottomNavigationBar> {
  late int index;

  @override
  Widget build(BuildContext context) {
    index = ref.watch(pageIndexProvider.state).state;
    return BottomNavigationBar(
      selectedItemColor: AppAssets.magenta,
      onTap: widget.onTap,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.wrnIcon),
          ),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.centsIcon),
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
