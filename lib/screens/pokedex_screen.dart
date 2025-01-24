import 'package:flutter/material.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Pokedex',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
