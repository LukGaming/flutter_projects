import 'package:cs2_gsi/models/map_stats.dart';
import 'package:flutter/material.dart';

class ShowMapStatsWidget extends StatelessWidget {
  final CSMap mapStats;
  const ShowMapStatsWidget({super.key, required this.mapStats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Mapa: ${mapStats.name}",
        ),
        const Text("Placar"),
        // Text("Terroristas: ${mapStats.teamCT.score}"),
        // Text("Contra-terroristas: ${mapStats.teamT.score}"),
        Text("Tempo de round: ${mapStats.round}"),
      ],
    );
  }
}
