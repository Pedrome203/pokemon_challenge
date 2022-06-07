class Ability {
  String? name;
  Ability({this.name});

  factory Ability.fromJson(Map<String, dynamic> data) {
    return Ability(
      name: data['name'],
    );
  }
}
