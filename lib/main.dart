import 'package:flutter/material.dart';

import 'package:my_pokedex/widgets/pokedex_list.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: const PokedexList(),
    );
  }
}
