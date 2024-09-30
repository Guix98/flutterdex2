import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/common/helpers/string_helpers.dart';
import 'package:flutter_dex_2/src/domain/models/pokemon_details.dart';

class StatsTab extends StatelessWidget {
  final List<Stat> stats;
  const StatsTab({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    List<StatRow> pokemonStats = stats
        .map((stat) => StatRow(
            statName: stat.stat.name.formatStatName(), value: stat.baseStat))
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: pokemonStats,
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  final String statName;
  final int value;
  const StatRow({super.key, required this.statName, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              statName,
              style: textTheme.labelMedium?.copyWith(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$value',
              style: textTheme.labelLarge?.copyWith(color: Color(0xFFEBC974)),
            ),
          ),
          Expanded(
            flex: 2,
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey[800],
              color: Color(0xFFEBC974),
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
