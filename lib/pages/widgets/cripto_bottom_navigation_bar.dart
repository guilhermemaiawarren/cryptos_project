import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/pages/widgets/page_index_provider.dart';

class CriptoBottomNavigationBar extends StatefulHookConsumerWidget {
  const CriptoBottomNavigationBar(
      {Key? key, required this.controller, required this.onTap})
      : super(key: key);
  final PageController controller;
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
      selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
      onTap: widget.onTap,
      currentIndex: ref.watch(pageIndexProvider.state).state,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/warren_logo.png'),
          ),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/cents.png'),
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
