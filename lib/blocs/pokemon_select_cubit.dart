import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/models/pokemon_model.dart';
import 'package:pokemon_challenge/resources/pokemon_repository.dart';

class PokemonState {
  const PokemonState(this.pokemon, {this.selected = false});
  final Pokemon? pokemon;
  final bool? selected;
}

class PokemonSelectionCubit extends Cubit<List<PokemonState>> {
  PokemonSelectionCubit(this._apiPokemonRepository) : super([]);
  final PokemonRepository _apiPokemonRepository;
  final nameTextController = TextEditingController();
  List<PokemonState> get selectedPokemons =>
      state.where((element) => element.selected!).toList();

  Future<void> init() async {
    final response = await _apiPokemonRepository.getPokemons();
    final pokemons = (response['data']).map((e) => PokemonState(e));
    emit(pokemons.toList().cast<PokemonState>());
  }

  void createGroup() {
    print(nameTextController);
  }

  void selectPokemon(PokemonState pokemon) {
    final index = state
        .indexWhere((element) => element.pokemon!.id == pokemon.pokemon!.id);
    state[index] =
        PokemonState(state[index].pokemon, selected: !pokemon.selected!);

    emit(List<PokemonState>.from(state));
  }
}

class PokemonsGroupCubit extends Cubit<bool> {
  PokemonsGroupCubit() : super(false);
  void changeToGroup() => emit(!state);
}
