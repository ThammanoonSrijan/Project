// character_stats.dart
class CharacterStats {
  int str = 1;
  int intStat = 1;
  int vit = 1;
  int agi = 1;
  int dex = 1;

  String specialType = "None";
  int specialValue = 1;

  /// Stats ใช้งาน/ไม่ใช้งาน
  bool enabled = true;

  /// ค่า Point ที่ผู้เล่นกำหนดเอง
  int totalPoints = 785;

  /// นับเฉพาะค่าที่ผู้เล่นอัพ (ไม่รวมค่าเริ่มต้น 1)
  int get strUsed => str - 1;
  int get intUsed => intStat - 1;
  int get vitUsed => vit - 1;
  int get agiUsed => agi - 1;
  int get dexUsed => dex - 1;
  int get specialUsed => specialType == "None" ? 0 : (specialValue - 1);

  /// รวมทั้งหมด
  int totalUsed() {
    return strUsed + intUsed + vitUsed + agiUsed + dexUsed + specialUsed;
  }

  /// ใช้คำนวณก่อนเพิ่มค่า stat ใด stat หนึ่ง
  int totalUsedExcluding(String label) {
    return totalUsed() -
        (label == "STR"
            ? strUsed
            : label == "INT"
            ? intUsed
            : label == "VIT"
            ? vitUsed
            : label == "AGI"
            ? agiUsed
            : label == "DEX"
            ? dexUsed
            : specialUsed);
  }

  Map<String, dynamic> toJson() {
    return {
      "STR": str,
      "INT": intStat,
      "VIT": vit,
      "AGI": agi,
      "DEX": dex,
      "SpecialType": specialType,
      "SpecialValue": specialValue,
      "Enabled": enabled,
      "TotalPoints": totalPoints,
      "UsedPoints": totalUsed(),
    };
  }
}
