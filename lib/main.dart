import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_pokedex/widgets/tabs_screen.dart';
import 'package:my_pokedex/providers/pokemon_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PokemonProvider()),
    ],
    child: Pokedex(),
  ));
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: const TabsScreen(),
    );
  }
}
