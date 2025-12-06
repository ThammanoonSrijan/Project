import 'package:flutter/material.dart';
import '../../models/character_stats.dart';

class StatsSummarySection extends StatelessWidget {
  final CharacterStats stats;

  StatsSummarySection({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Final Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            summaryRow("Total STR", stats.str),
            summaryRow("Total INT", stats.intStat),
            summaryRow("Total VIT", stats.vit),
            summaryRow("Total AGI", stats.agi),
            summaryRow("Total DEX", stats.dex),

            if (stats.specialType != "None") ...[
              Divider(),
              summaryRow(stats.specialType, stats.specialValue),
            ]
          ],
        ),
      ),
    );
  }

  Widget summaryRow(String label, int value) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Text("$value"),
      ],
    );
  }
}
