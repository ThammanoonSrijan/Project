class Weapon {
  final String id;
  final String name;
  final int baseAtk;
  int watk;
  int refine;

  Weapon({
    required this.id,
    required this.name,
    required this.baseAtk,
    this.watk = 0,
    this.refine = 0,
  });

  static List<String> enhanceLabels = <String>[
    "+0",
    "+1",
    "+2",
    "+3",
    "+4",
    "+5",
    "+6",
    "+7",
    "+8",
    "+9",
    "+10",
    "+11",
    "+12",
    "+13",
    "+14",
    "+15",
  ];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "baseAtk": baseAtk,
      "watk": watk,
      "refine": refine,
    };
  }
}
