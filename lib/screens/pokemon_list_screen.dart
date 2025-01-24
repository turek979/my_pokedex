import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_pokedex/providers/pokemon_provider.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Pokémon List')),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !pokemonProvider.isFetchingMore) {
            pokemonProvider.fetchMorePokemon(); // Fetch more when at the bottom
          }
          return true;
        },
        child: pokemonProvider.isLoading && pokemonProvider.pokemonList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: pokemonProvider.pokemonList.length +
                    (pokemonProvider.isFetchingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == pokemonProvider.pokemonList.length) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final pokemon = pokemonProvider.pokemonList[index];
                  return ListTile(
                    leading: Image.network(pokemon.imageUrl),
                    title: Text(pokemon.name),
                  );
                },
              ),
      ),
    );
  }
}
