import 'package:flutter/material.dart';
import '../../models/character_stats.dart';

class SpecialStatsSection extends StatelessWidget {
  final CharacterStats stats;

  SpecialStatsSection({
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
              "Special Stats",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: Text("Special Type")),
                Text(stats.specialType),
              ],
            ),

            if (stats.specialType != "None")
              Row(
                children: [
                  Expanded(child: Text("Value")),
                  Text("${stats.specialValue}"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
