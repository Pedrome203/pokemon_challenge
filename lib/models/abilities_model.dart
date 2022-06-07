import 'package:pokemon_challenge/models/ability_model.dart';

class Abilities {
  Ability? ability;
  Abilities({this.ability});

  factory Abilities.fromJson(Map<String, dynamic> data) {
    Ability? _ability = Ability.fromJson(data['ability']);

    return Abilities(
      ability: _ability,
    );
  }
}
