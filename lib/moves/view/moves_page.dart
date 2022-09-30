import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/moves/controller/movements_provider.dart';
import 'package:projeto_criptos/moves/model/movement_model.dart';
import 'package:projeto_criptos/shared/common_model/move.dart';

import '../../shared/templates/custom_bottom_nav_bar.dart';
import 'moves_screen.dart';

class MovesPage extends ConsumerStatefulWidget {
  const MovesPage({
    Key? key,
    this.model,
  }) : super(key: key);
  static const route = '/moves';
  final MoveModel? model;

  @override
  ConsumerState<MovesPage> createState() => _$MovesPageState();
}

class _$MovesPageState extends ConsumerState<MovesPage> {
  @override
  void initState() {
    super.initState();
    if (widget.model != null) {
      Future.delayed(Duration.zero, () {
        setState(() {
          ref
              .read(movementsProvider.state)
              .state
              .add(MovementModel.fromMap(widget.model!.toMap()));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovesScreen(),
      bottomNavigationBar: CustomBottomNavBar(index: 1),
    );
  }
}
