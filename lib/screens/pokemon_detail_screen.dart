import 'package:flutter/material.dart';

import 'package:my_pokedex/models/pokemon_model.dart';
import 'package:my_pokedex/widgets/my_app_bar.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: pokemon.name, appBar: AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.network(
                pokemon.imageUrl,
                height: 300,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              pokemon.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Detail 1:'),
                    subtitle: const Text('Example detail about this Pokémon.'),
                  ),
                  ListTile(
                    title: const Text('Detail 2:'),
                    subtitle: const Text('Additional example detail.'),
                  ),
                  // Add more details as needed.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
