import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/common/helpers/string_helpers.dart';
import 'package:flutter_dex_2/src/domain/models/pokemon_details.dart';

class MovesTab extends StatelessWidget {
  final List<Move> moves;
  const MovesTab({super.key, required this.moves});

  @override
  Widget build(BuildContext context) {
    final firstEightMoves =
        moves.take(8).toList().map((e) => e.move.name).toList();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0,
          runSpacing: 8.0,
          children: firstEightMoves
              .map((move) => MoveChip(move: move.formatCamelString()))
              .toList(),
        ));
  }
}

class MoveChip extends StatelessWidget {
  final String move;

  const MoveChip({super.key, required this.move});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Chip(
      shape: StadiumBorder(),
      label: Text(move,
          style: textTheme.labelMedium?.copyWith(color: Colors.white)),
      backgroundColor: Colors.white.withOpacity(0.2),
      elevation: 1,
      shadowColor: Colors.white,
      side: BorderSide.none,
    );
  }
}
