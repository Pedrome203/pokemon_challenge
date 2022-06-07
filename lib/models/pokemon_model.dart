import 'package:pokemon_challenge/models/abilities_model.dart';
import 'package:pokemon_challenge/models/base_stats_model.dart';
import 'package:pokemon_challenge/models/sprite_model.dart';
import 'package:pokemon_challenge/models/types_model.dart';

class Pokemon {
  int? id;
  String? name;
  int? height;
  int? weight;
  List<BaseStat>? stats;
  List<Abilities>? abilities;
  List<Types>? types;
  Sprite? sprites;
  Pokemon(
      {this.id,
      this.name,
      this.height,
      this.weight,
      this.stats,
      this.types,
      this.sprites,
      this.abilities});

  factory Pokemon.fromJson(Map<String, dynamic> data) {
    List<BaseStat>? _listStats = data['stats']
        .map((json) => BaseStat.fromJson(json))
        .toList()
        .cast<BaseStat>();
    List<Abilities>? _listAbilities = data['abilities']
        .map((json) => Abilities.fromJson(json))
        .toList()
        .cast<Abilities>();
    List<Types>? _types = data['types']
        .map((json) => Types.fromJson(json))
        .toList()
        .cast<Types>();
    Sprite _sprites = Sprite.fromJson(data['sprites']);
    return Pokemon(
        id: data['id'],
        name: data['name'],
        height: data['height'],
        weight: data['weight'],
        stats: _listStats,
        types: _types,
        sprites: _sprites,
        abilities: _listAbilities);
  }
}
