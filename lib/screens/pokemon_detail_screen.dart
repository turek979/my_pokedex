import 'package:flutter/material.dart';

import 'package:my_pokedex/models/pokemon_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.network(
                pokemon.image2Url,
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
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Detail 1:'),
                      subtitle:
                          const Text('Example detail about this Pokémon.'),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Detail 2:'),
                      subtitle: const Text('Additional example detail.'),
                    ),
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
