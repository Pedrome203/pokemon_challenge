import 'dart:convert';

import 'package:pokemon_challenge/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

import 'package:pokemon_challenge/resources/pokemon_repository.dart';

class PokemonImpl extends PokemonRepository {
  @override
  Future<Map<String, dynamic>> getPokemons() async {
    List<Pokemon> pokemons = <Pokemon>[];
    int i = 1;
    while (i <= 150) {
      Uri url =
          Uri.parse('https://pokeapi.co/api/v2/pokemon/' + i.toString() + '/');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Pokemon pokemon = Pokemon.fromJson(jsonDecode(response.body));
        pokemons.add(pokemon);
      }

      i++;
    }

    return {
      'data': pokemons,
    };
  }
}
