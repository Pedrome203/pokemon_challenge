import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/resources/pokemon_impl.dart';
import 'package:pokemon_challenge/resources/pokemon_repository.dart';

List<RepositoryProvider> buildRepositories() {
  return [
    RepositoryProvider<PokemonRepository>(create: (_) => PokemonImpl()),
  ];
}
