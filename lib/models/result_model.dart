import 'package:pokemon_challenge/models/pokemon_model.dart';

class Result {
  List<Pokemon>? results;
  Result({this.results});

  factory Result.fromJson(Map<String, dynamic> data) {
    List<Pokemon>? _listPokemons = data['results']
        .map((json) => Pokemon.fromJson(json))
        .toList()
        .cast<Pokemon>();
    return Result(
      results: _listPokemons,
    );
  }
}
