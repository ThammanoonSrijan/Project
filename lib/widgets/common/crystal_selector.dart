import 'package:flutter/material.dart';
import '../../models/crystal.dart';

class CrystalSelector extends StatelessWidget {
  final List<Crystal> available;
  final List<Crystal> selected;
  final void Function(Crystal) onAdd;
  final void Function(int) onRemove;

  const CrystalSelector({
    super.key,
    required this.available,
    required this.selected,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Crystals",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: _buildSelectedChips(),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            _openCrystalDialog(context);
          },
          icon: const Icon(Icons.add),
          label: const Text("Add Crystal"),
        ),
      ],
    );
  }

  List<Widget> _buildSelectedChips() {
    List<Widget> chips = <Widget>[];
    int i = 0;
    while (i < selected.length) {
      final c = selected[i];
      chips.add(
        Chip(
          label: Text(c.name),
          onDeleted: () => onRemove(i),
        ),
      );
      i = i + 1;
    }
    if (chips.isEmpty) {
      chips.add(const Text("No crystals selected"));
    }
    return chips;
  }

  void _openCrystalDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        String filter = "";
        return StatefulBuilder(
          builder: (ctx, setStateDialog) {
            List<Crystal> list = <Crystal>[];
            int i = 0;
            while (i < available.length) {
              Crystal c = available[i];
              bool already = false;
              int j = 0;
              while (j < selected.length) {
                if (selected[j].id == c.id) {
                  already = true;
                  break;
                }
                j = j + 1;
              }
              bool match = filter.isEmpty ||
                  c.name.toLowerCase().contains(filter.toLowerCase());
              if (!already && match) {
                list.add(c);
              }
              i = i + 1;
            }

            return AlertDialog(
              title: const Text("Select Crystal"),
              content: SizedBox(
                width: double.maxFinite,
                height: 400,
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                      ),
                      onChanged: (v) {
                        setStateDialog(() {
                          filter = v;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (c, i) {
                          final crystal = list[i];
                          return ListTile(
                            title: Text(crystal.name),
                            subtitle: Text(crystal.bonuses.toString()),
                            onTap: () {
                              onAdd(crystal);
                              Navigator.pop(ctx);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
