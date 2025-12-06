import 'package:flutter/material.dart';
import '../../models/character_stats.dart';

class CharacterStatsSection extends StatefulWidget {
  final CharacterStats stats;

  CharacterStatsSection({
    super.key,
    required this.stats,
  });

  @override
  State<CharacterStatsSection> createState() => _CharacterStatsSectionState();
}

class _CharacterStatsSectionState extends State<CharacterStatsSection> {
  late CharacterStats stats;

  @override
  void initState() {
    super.initState();
    stats = widget.stats;
  }

  int remainingPoints() {
    return stats.totalPoints - stats.totalUsed();
  }

  Widget statRow({
    required String label,
    required int value,
    required int max,
    required Function(int) onChanged,
  }) {
    final remain = remainingPoints() + (value - 1);

    return Row(
      children: [
        SizedBox(width: 40, child: Text(label)),
        SizedBox(
          width: 70,
          child: TextField(
            controller: TextEditingController(text: value.toString()),
            keyboardType: TextInputType.number,
            onSubmitted: (v) {
              final n = int.tryParse(v) ?? value;
              if (n >= 1 && n <= max && (n - 1) <= remain) {
                setState(() => onChanged(n));
              }
            },
          ),
        ),
        Expanded(
          child: Slider(
            value: value.toDouble(),
            min: 1,
            max: max.toDouble(),
            divisions: max - 1,
            onChanged: (v) {
              final newVal = v.toInt();
              if ((newVal - 1) <= remain) {
                setState(() => onChanged(newVal));
              }
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Character Stats",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),
            Row(
              children: [
                Text("Total Points: "),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: TextEditingController(text: stats.totalPoints.toString()),
                    keyboardType: TextInputType.number,
                    onSubmitted: (v) {
                      final n = int.tryParse(v) ?? stats.totalPoints;
                      setState(() => stats.totalPoints = n);
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),
            Text(
              "Used: ${stats.totalUsed()}   Remaining: ${remainingPoints()}",
              style: TextStyle(
                color: remainingPoints() < 0 ? Colors.red : Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            statRow(label: "STR", value: stats.str, max: 510, onChanged: (v) => stats.str = v),
            statRow(label: "INT", value: stats.intStat, max: 510, onChanged: (v) => stats.intStat = v),
            statRow(label: "VIT", value: stats.vit, max: 510, onChanged: (v) => stats.vit = v),
            statRow(label: "AGI", value: stats.agi, max: 510, onChanged: (v) => stats.agi = v),
            statRow(label: "DEX", value: stats.dex, max: 510, onChanged: (v) => stats.dex = v),

            SizedBox(height: 16),

            Row(
              children: [
                Text("Special: "),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: stats.specialType,
                  items: ["None", "CRT", "LUK", "MTL", "TEC"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      stats.specialType = v!;
                      if (v == "None") stats.specialValue = 1;
                    });
                  },
                ),
              ],
            ),

            if (stats.specialType != "None")
              statRow(
                label: stats.specialType,
                value: stats.specialValue,
                max: 255,
                onChanged: (v) => stats.specialValue = v,
              ),
          ],
        ),
      ),
    );
  }
}
