import 'package:flutter_bloc/flutter_bloc.dart';

enum PokemonDetailsState { info, stats }

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit([read]) : super(PokemonDetailsState.info);
  void init() {
    emit(PokemonDetailsState.info);
  }

  void changePage(int num) {
    if (num == 0) {
      emit(PokemonDetailsState.info);
    } else {
      emit(PokemonDetailsState.stats);
    }
  }
}
