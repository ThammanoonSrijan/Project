class Crystal {
  final String id;
  final String name;
  final Map<String, num> bonuses;

  Crystal({
    required this.id,
    required this.name,
    required this.bonuses,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "bonuses": bonuses,
    };
  }
}
