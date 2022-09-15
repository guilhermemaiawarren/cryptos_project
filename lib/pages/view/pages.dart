import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';

import '../widgets/cripto_bottom_navigation_bar.dart';
import '../controller/page_index_provider.dart';
import '../widgets/page_view_controller.dart';

class Pages extends StatefulHookConsumerWidget {
  const Pages({Key? key}) : super(key: key);
  @override
  ConsumerState<Pages> createState() => _PagesState();
}

class _PagesState extends ConsumerState<Pages> {
  late int index;
  void changePage(int screen) {
    controller.animateToPage(
      screen,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
    setState(() {
      ref.read(pageIndexProvider.state).state = screen;
    });
  }

  late PageController controller;

  @override
  void initState() {
    super.initState();
    index = ref.read(pageIndexProvider.state).state;
    controller = PageController(initialPage: index);
  }
  List<Widget> pages = [
    const Pages(),
    const DetailsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewController(
        controller: controller,
        onPageChanged: changePage,
      ),
      bottomNavigationBar: CriptoBottomNavigationBar(
        onTap: changePage,
      ),
    );
  }
}
