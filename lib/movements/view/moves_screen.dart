import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/user/movements_provider.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';

import '../widgets/movements_list_tile.dart';

class MovesScreen extends ConsumerWidget {
  const MovesScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moves = ref.watch(movementsProvider);
    return Padding(
      padding: const EdgeInsets.only(
        top: 55,
        left: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 25,
            ),
            child: Text(
              'Movimentações',
              style: TextStyle(
                fontFamily: AppAssets.montSerrat,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: moves.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Divider(thickness: 1),
                    MovementListTile(
                      model: moves[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
