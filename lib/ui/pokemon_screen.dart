import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/blocs/pokemon_select_cubit.dart';
import 'package:pokemon_challenge/ui/pokemon_details_screen.dart';
import 'package:pokemon_challenge/utils/navigator_utils.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonSelectionCubit(context.read())..init(),
        ),
        BlocProvider(create: (_) => PokemonsGroupCubit())
      ],
      child: BlocBuilder<PokemonsGroupCubit, bool>(builder: (context, isGroup) {
        return BlocBuilder<PokemonSelectionCubit, List<PokemonState>>(
            builder: (context, snapshot) {
          final selectedPokemons =
              context.read<PokemonSelectionCubit>().selectedPokemons;
          return Scaffold(
            floatingActionButton: snapshot.length > 0
                ? FloatingActionButton(
                    onPressed: () {
                      context.read<PokemonsGroupCubit>().changeToGroup();
                    },
                    backgroundColor: Colors.redAccent,
                    child: const Icon(Icons.circle_sharp),
                  )
                : null,
            body: snapshot.length > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 50,
                    ),
                    child: Column(
                      children: [
                        if (!isGroup)
                          const Text(
                            "Pokedex",
                            style: TextStyle(
                                fontFamily: '',
                                fontSize: 24,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        if (isGroup)
                          const Text(
                            "Seleccion tu equipo",
                            style: TextStyle(
                                fontFamily: '',
                                fontSize: 21,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        if (selectedPokemons.isNotEmpty && isGroup)
                          SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: selectedPokemons.length,
                                  itemBuilder: (context, index) {
                                    final pokemonState =
                                        selectedPokemons[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13.0),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    pokemonState
                                                        .pokemon!
                                                        .sprites!
                                                        .other!
                                                        .home!
                                                        .front!),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 40,
                                            right: -4,
                                            child: InkWell(
                                              onTap: () => context
                                                  .read<PokemonSelectionCubit>()
                                                  .selectPokemon(pokemonState),
                                              child: const CircleAvatar(
                                                radius: 9,
                                                backgroundColor: Colors.red,
                                                child: Icon(Icons.close_rounded,
                                                    size: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                        if (selectedPokemons.length == 6 && isGroup)
                          Column(
                            children: [
                              TextField(
                                controller: context
                                    .read<PokemonSelectionCubit>()
                                    .nameTextController,
                                decoration: const InputDecoration(
                                  hintText: 'Name group',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Crear Equipo'),
                              ),
                            ],
                          ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: snapshot.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  final pokemonState = snapshot[index];

                                  return GestureDetector(
                                    onTap: () {
                                      !isGroup
                                          ? pushToPage(context,
                                              PokemonDetails(pokemonState))
                                          : null;
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: pokemonState.pokemon!.types![0].type!.name ==
                                                  'fire'
                                              ? const Color.fromARGB(
                                                  255, 255, 81, 68)
                                              : pokemonState.pokemon!.types![0].type!.name ==
                                                      'grass'
                                                  ? const Color.fromARGB(
                                                      255, 23, 190, 148)
                                                  : pokemonState
                                                              .pokemon!
                                                              .types![0]
                                                              .type!
                                                              .name ==
                                                          'water'
                                                      ? const Color.fromARGB(
                                                          255, 27, 168, 228)
                                                      : pokemonState
                                                                  .pokemon!
                                                                  .types![0]
                                                                  .type!
                                                                  .name ==
                                                              'poison'
                                                          ? const Color.fromARGB(
                                                              255, 227, 45, 148)
                                                          : pokemonState
                                                                      .pokemon!
                                                                      .types![0]
                                                                      .type!
                                                                      .name ==
                                                                  'fly'
                                                              ? const Color.fromARGB(255, 169, 176, 179)
                                                              : pokemonState.pokemon!.types![0].type!.name == 'bug'
                                                                  ? Color.fromARGB(255, 144, 27, 228)
                                                                  : pokemonState.pokemon!.types![0].type!.name == 'normal'
                                                                      ? Color.fromARGB(255, 88, 246, 88)
                                                                      : pokemonState.pokemon!.types![0].type!.name == 'electric'
                                                                          ? Color.fromARGB(255, 235, 220, 59)
                                                                          : pokemonState.pokemon!.types![0].type!.name == 'ground'
                                                                              ? Color.fromARGB(255, 86, 70, 48)
                                                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  pokemonState.pokemon!.name!,
                                                  style: const TextStyle(
                                                      fontFamily: 'Roboto Mono',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 50),
                                                child: ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: pokemonState
                                                        .pokemon!.types!.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final _types =
                                                          pokemonState.pokemon!
                                                              .types![index];
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: pokemonState
                                                                      .pokemon!
                                                                      .types![0]
                                                                      .type!
                                                                      .name ==
                                                                  'fire'
                                                              ? const Color.fromARGB(
                                                                  255, 237, 48, 34)
                                                              : pokemonState
                                                                          .pokemon!
                                                                          .types![
                                                                              0]
                                                                          .type!
                                                                          .name ==
                                                                      'grass'
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      5,
                                                                      156,
                                                                      119)
                                                                  : pokemonState.pokemon!.types![0].type!.name ==
                                                                          'water'
                                                                      ? const Color.fromARGB(
                                                                          255,
                                                                          10,
                                                                          141,
                                                                          197)
                                                                      : pokemonState.pokemon!.types![0].type!.name == 'poison'
                                                                          ? Color.fromARGB(255, 186, 23, 115)
                                                                          : pokemonState.pokemon!.types![0].type!.name == 'fly'
                                                                              ? Color.fromARGB(255, 169, 176, 179)
                                                                              : pokemonState.pokemon!.types![0].type!.name == 'bug'
                                                                                  ? Color.fromARGB(255, 130, 12, 214)
                                                                                  : pokemonState.pokemon!.types![0].type!.name == 'normal'
                                                                                      ? Color.fromARGB(255, 56, 219, 56)
                                                                                      : pokemonState.pokemon!.types![0].type!.name == 'electric'
                                                                                          ? Color.fromARGB(255, 194, 179, 23)
                                                                                          : pokemonState.pokemon!.types![0].type!.name == 'ground'
                                                                                              ? Color.fromARGB(255, 61, 51, 37)
                                                                                              : Color.fromARGB(255, 209, 202, 202),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 3,
                                                                  horizontal:
                                                                      3),
                                                          child: Text(
                                                            _types.type!.name
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'RobotoMono'),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              )),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Image.network(
                                              pokemonState.pokemon!.sprites!
                                                  .other!.home!.front!,
                                              height: 150,
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: isGroup &&
                                                      selectedPokemons.length <
                                                          6
                                                  ? Checkbox(
                                                      value:
                                                          pokemonState.selected,
                                                      onChanged: (val) {
                                                        context
                                                            .read<
                                                                PokemonSelectionCubit>()
                                                            .selectPokemon(
                                                                pokemonState);
                                                      },
                                                    )
                                                  : null),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(child: Loading()),
          );
        });
      }),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: [
      Center(
        child: Image.network(
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/7.png",
          height: 180.0,
          width: 180.0,
        ),
      ),
      const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 270),
            child: Text('Vamo a calmarno...'),
          )),
      const SizedBox(
        height: 20,
      ),
      const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 300),
            child: Text('Espera mientras carga la pokedex'),
          )),
      Positioned(
        bottom: 10.0,
        width: MediaQuery.of(context).size.width,
        child: Column(children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 10.0,
          ),
        ]),
      )
    ]));
  }
}
