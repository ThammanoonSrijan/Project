import 'package:flutter/material.dart';

class CustomNavigationRail extends StatefulWidget {
  const CustomNavigationRail({super.key});

  @override
  State<CustomNavigationRail> createState() => CustomNavigationRailState();
}

class CustomNavigationRailState extends State<CustomNavigationRail> {
  bool extended = false;
  int selectedIndex = 0;

  void toggleExtended() {
    setState(() {
      extended = !extended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: extended,
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      labelType:
          extended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: Text("Build"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.storage_outlined),
          selectedIcon: Icon(Icons.storage),
          label: Text("Storage"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text("Settings"),
        ),
      ],
    );
  }
}
