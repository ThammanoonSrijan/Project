import '../models/weapon.dart';
import '../models/crystal.dart';

class EquipmentService {
  static List<Weapon> sampleWeapons() {
    List<Weapon> list = <Weapon>[];
    list.add(Weapon(id: "sword_1", name: "Short Sword", baseAtk: 50, watk: 70));
    list.add(Weapon(id: "sword_2", name: "Long Sword", baseAtk: 80, watk: 110));
    list.add(Weapon(id: "bow_1", name: "Hunter Bow", baseAtk: 60, watk: 90));
    list.add(Weapon(id: "staff_1", name: "Mage Staff", baseAtk: 40, watk: 85));
    return list;
  }

  static List<Crystal> sampleCrystals() {
    List<Crystal> list = <Crystal>[];
    list.add(Crystal(
      id: "atk_3",
      name: "Atk +3%",
      bonuses: {"ATK%": 3},
    ));
    list.add(Crystal(
      id: "hp_5",
      name: "HP +5%",
      bonuses: {"HP%": 5},
    ));
    list.add(Crystal(
      id: "crit_10",
      name: "Crit +10",
      bonuses: {"CritRate": 10},
    ));
    return list;
  }
}
