// build_simulator_screen.dart

import 'package:flutter/material.dart';

import '../models/character_stats.dart';
import '../widgets/build_page/character_stats_section.dart';
import '../widgets/build_page/weapon_config_section.dart';
import '../widgets/build_page/stats_summary_section.dart';
import '../widgets/build_page/special_stats_section.dart';

class BuildSimulatorScreen extends StatefulWidget {
  const BuildSimulatorScreen({super.key});

  @override
  State<BuildSimulatorScreen> createState() => _BuildSimulatorScreenState();
}

class _BuildSimulatorScreenState extends State<BuildSimulatorScreen> {
  final CharacterStats stats = CharacterStats();

  static const double mobileMaxWidth = 700;
  static const double tabletMinWidth = 700;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final width = c.maxWidth;
      final isMobile = width < mobileMaxWidth;
      final isDesktop = width >= tabletMinWidth;

      return Scaffold(
        backgroundColor: const Color(0xFF1C1C2E),
        appBar: AppBar(
          backgroundColor: const Color(0xFF119D7C),
          title: Text(
            isMobile ? "Toram Build" : "Toram Item Build Simulation",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Row(
          children: [
            if (isDesktop)
              Container(
                width: 70,
                color: const Color(0xFF2E2F4F),
                child: const Center(
                  child: Icon(Icons.menu, color: Colors.white),
                ),
              ),

            Expanded(child: _buildMainContent(isMobile)),
          ],
        ),
      );
    });
  }

  Widget _buildMainContent(bool isMobile) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF383B68).withOpacity(0.24),
            borderRadius: BorderRadius.circular(20),
          ),
          child: isMobile
              ? SingleChildScrollView(child: _mobileLayout())
              : _desktopLayout(),
        ),
      ),
    );
  }

  // ---------- Mobile Vertical Layout ----------
  Widget _mobileLayout() {
    return Column(
      children: [
        CharacterStatsSection(stats: stats),
        const SizedBox(height: 24),

        WeaponConfigSection(stats: stats),
        const SizedBox(height: 24),

        StatsSummarySection(stats: stats),
        const SizedBox(height: 24),

        SpecialStatsSection(stats: stats),
        const SizedBox(height: 50),
      ],
    );
  }

  // ---------- Desktop 3-column Layout ----------
  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              CharacterStatsSection(stats: stats),
              const SizedBox(height: 24),
              WeaponConfigSection(stats: stats),
            ],
          ),
        ),
        const SizedBox(width: 24),

        Expanded(
          flex: 3,
          child: Column(
            children: [
              StatsSummarySection(stats: stats),
              const SizedBox(height: 24),
              SpecialStatsSection(stats: stats),
            ],
          ),
        ),
        const SizedBox(width: 24),

        Expanded(
          flex: 3,
          child: _equipmentPlaceholder(),
        ),
      ],
    );
  }

  static Widget _equipmentPlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.25)),
      ),
      child: const Column(
        children: [
          Icon(Icons.shield, size: 50, color: Colors.cyanAccent),
          SizedBox(height: 16),
          Text(
            "Equipment Slots (Armor / AddGear / Ring …)",
            style: TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
