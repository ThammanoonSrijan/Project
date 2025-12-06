import 'package:flutter/material.dart';
import '../../models/character_stats.dart';

class WeaponConfigSection extends StatefulWidget {
  final CharacterStats stats;

  WeaponConfigSection({
    super.key,
    required this.stats,
  });

  @override
  State<WeaponConfigSection> createState() => _WeaponConfigSectionState();
}

class _WeaponConfigSectionState extends State<WeaponConfigSection> {
  String? selectedWeapon;
  int refine = 0;
  int watk = 0;

  final List<String> sampleWeapons = [
    "Long Sword",
    "Magic Staff",
    "Bow",
    "Knuckles",
    "Halberd",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Main Weapon",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            DropdownButton<String>(
              value: selectedWeapon,
              hint: Text("Select Weapon"),
              items: sampleWeapons
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => selectedWeapon = v),
            ),

            SizedBox(height: 12),

            Row(
              children: [
                Text("Enhance: "),
                DropdownButton<int>(
                  value: refine,
                  items: List.generate(
                    16,
                        (i) => DropdownMenuItem(value: i, child: Text("+$i")),
                  ),
                  onChanged: (v) => setState(() => refine = v ?? 0),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              children: [
                Text("WATK: "),
                SizedBox(
                  width: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(text: watk.toString()),
                    onSubmitted: (v) =>
                        setState(() => watk = int.tryParse(v) ?? watk),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
