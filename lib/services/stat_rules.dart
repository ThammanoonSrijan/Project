import '../models/character_stats.dart';

class StatRules {
  static int clampBase(int v) {
    if (v < 1) return 1;
    if (v > 510) return 510;
    return v;
  }

  static int clampSpecial(int v) {
    if (v < 1) return 1;
    if (v > 255) return 255;
    return v;
  }

  static void enforceLimits(CharacterStats stats) {
    stats.str = clampBase(stats.str);
    stats.intStat = clampBase(stats.intStat);
    stats.vit = clampBase(stats.vit);
    stats.agi = clampBase(stats.agi);
    stats.dex = clampBase(stats.dex);
    if (stats.specialType == "None") {
      stats.specialValue = 1;
    } else {
      stats.specialValue = clampSpecial(stats.specialValue);
    }

    int used = stats.totalUsed();
    if (used <= stats.totalPoints) {
      return;
    }

    // ถ้าใช้เกิน totalPoints จะค่อย ๆ ลดจาก DEX, AGI, VIT, INT, STR
    List<String> order = <String>["DEX", "AGI", "VIT", "INT", "STR"];
    int index = 0;
    while (used > stats.totalPoints && index < order.length) {
      String label = order[index];
      if (label == "DEX" && stats.dex > 1) {
        stats.dex = stats.dex - 1;
      } else if (label == "AGI" && stats.agi > 1) {
        stats.agi = stats.agi - 1;
      } else if (label == "VIT" && stats.vit > 1) {
        stats.vit = stats.vit - 1;
      } else if (label == "INT" && stats.intStat > 1) {
        stats.intStat = stats.intStat - 1;
      } else if (label == "STR" && stats.str > 1) {
        stats.str = stats.str - 1;
      } else {
        index = index + 1;
      }
      used = stats.totalUsed();
    }
  }
}
