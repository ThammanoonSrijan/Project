import '../models/character_stats.dart';
import '../models/weapon.dart';
import '../models/crystal.dart';

class CalcService {
  static int calcATK(CharacterStats stats, Weapon? weapon) {
    int base = stats.str * 2 + stats.dex;
    int weaponAtk = 0;
    if (weapon != null) {
      weaponAtk = weapon.watk + weapon.baseAtk;
      weaponAtk = weaponAtk + (weapon.refine * 5);
    }
    return base + weaponAtk;
  }

  static int calcMATK(CharacterStats stats) {
    int base = stats.intStat * 3 + stats.dex;
    return base;
  }

  static int calcHP(CharacterStats stats) {
    int base = 1000 + stats.vit * 30;
    return base;
  }

  static int calcCritRate(CharacterStats stats) {
    int base = 25;
    if (stats.specialType == "CRT") {
      base = base + stats.specialValue;
    }
    return base;
  }

  static Map<String, num> mergeCrystalStats(List<Crystal> crystals) {
    Map<String, num> out = <String, num>{};
    int i = 0;
    while (i < crystals.length) {
      Crystal c = crystals[i];
      c.bonuses.forEach((key, value) {
        if (out.containsKey(key)) {
          out[key] = (out[key] ?? 0) + value;
        } else {
          out[key] = value;
        }
      });
      i = i + 1;
    }
    return out;
  }
}
