import 'package:flutter/material.dart';
import 'package:pokemon_challenge/blocs/pokemon_select_cubit.dart';

class PokemonDetails extends StatefulWidget {
  PokemonDetails(this.pokemon, {Key? key}) : super(key: key);
  final PokemonState pokemon;

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  PageController controller = PageController();
  int page = 0;
  void updatePage(int p) {
    setState(() {
      page = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(children: [
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: widget.pokemon.pokemon!.types![0].type!.name == 'fire'
                    ? const Color.fromARGB(255, 255, 81, 68)
                    : widget.pokemon.pokemon!.types![0].type!.name == 'grass'
                        ? const Color.fromARGB(255, 23, 190, 148)
                        : widget.pokemon.pokemon!.types![0].type!.name ==
                                'water'
                            ? const Color.fromARGB(255, 27, 168, 228)
                            : widget.pokemon.pokemon!.types![0].type!.name ==
                                    'poison'
                                ? const Color.fromARGB(255, 227, 45, 148)
                                : widget.pokemon.pokemon!.types![0].type!
                                            .name ==
                                        'fly'
                                    ? const Color.fromARGB(255, 169, 176, 179)
                                    : widget.pokemon.pokemon!.types![0].type!
                                                .name ==
                                            'bug'
                                        ? Color.fromARGB(255, 144, 27, 228)
                                        : widget.pokemon.pokemon!.types![0]
                                                    .type!.name ==
                                                'normal'
                                            ? Color.fromARGB(255, 88, 246, 88)
                                            : widget.pokemon.pokemon!.types![0]
                                                        .type!.name ==
                                                    'electric'
                                                ? const Color.fromARGB(
                                                    255, 235, 220, 59)
                                                : widget
                                                            .pokemon
                                                            .pokemon!
                                                            .types![0]
                                                            .type!
                                                            .name ==
                                                        'ground'
                                                    ? Color.fromARGB(
                                                        255, 86, 70, 48)
                                                    : Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10),
                child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      updatePage(0);
                                      controller.jumpTo(0);
                                      controller.jumpToPage(0);
                                    },
                                    child: const Text('About'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    width: widthScreen * .40,
                                    height: 5.0,
                                    color:
                                        page == 0 ? Colors.grey : Colors.white)
                              ],
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        updatePage(1);
                                        controller.jumpTo(1);
                                        controller.jumpToPage(1);
                                      },
                                      child: const Text('Base Stats')),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    width: widthScreen * .40,
                                    height: 5.0,
                                    color:
                                        page == 1 ? Colors.grey : Colors.white)
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: PageView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (num) {
                            updatePage(num);
                          },
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Weight',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.pokemon.pokemon!.weight!
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Height',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.pokemon.pokemon!.height!
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Ability',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.pokemon.pokemon!.abilities![0]
                                            .ability!.name!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      widget.pokemon.pokemon!.stats!.length,
                                  itemBuilder: (context, index) {
                                    final _stats =
                                        widget.pokemon.pokemon!.stats![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              _stats.stat!.name.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'RobotoMono'),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              _stats.baseStat!.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'RobotoMono'),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                width:
                                                    _stats.baseStat!.toDouble(),
                                                height: 5.0,
                                                color: _stats.baseStat! < 50
                                                    ? Colors.red
                                                    : Colors.green),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  widget.pokemon.pokemon!.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.network(
                    widget.pokemon.pokemon!.sprites!.other!.home!.front!,
                    height: 200,
                  ),
                )),
          ],
        ),
      ])
    ]));
  }
}
