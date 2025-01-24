import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_pokedex/providers/pokemon_provider.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider =
        Provider.of<PokemonProvider>(context, listen: false);
    pokemonProvider.fetchPokemonList();

    return Scaffold(
      appBar: AppBar(title: const Text('Pokémon List')),
      body: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: provider.pokemonList.length,
                  itemBuilder: (context, index) {
                    final pokemon = provider.pokemonList[index];
                    return ListTile(
                      leading: Image.network(
                        pokemon.imageUrl,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error), // Handle image errors
                      ),
                      title: Text(pokemon.name),
                    );
                  },
                );
        },
      ),
    );
  }
}
