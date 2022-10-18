import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/core_strings.dart';
import '../../shared/user/movements_provider.dart';
import '../../shared/templates/app_assets.dart';

import '../widgets/movements_list_tile.dart';

class MovesScreen extends ConsumerWidget {
  const MovesScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moves = ref.watch(movementsProvider);
    return Padding(
      key: const Key('MovesScreenBody'),
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
              CoreStrings.of(context)!.moves,
              key: const Key('Movimentações'),
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
