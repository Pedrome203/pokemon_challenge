import 'package:flutter/material.dart';
import 'package:pokemon_challenge/dependecies.dart';
import 'package:pokemon_challenge/ui/pokemon_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: buildRepositories(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FluChat',
          home: PokemonScreen(),
        ));
  }
}
