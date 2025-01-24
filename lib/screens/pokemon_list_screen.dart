import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_pokedex/providers/pokemon_provider.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  String _searchQuery = ''; // Current search query
  late PokemonProvider _pokemonProvider;

  @override
  void initState() {
    super.initState();
    _pokemonProvider = Provider.of<PokemonProvider>(context, listen: false);
    _pokemonProvider.fetchPokemonList(); // Fetch Pokémon on screen load
  }

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    // Filter Pokémon list based on search query
    final filteredPokemonList = pokemonProvider.pokemonList
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Pokémon',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pokemonProvider.isLoading && pokemonProvider.pokemonList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !pokemonProvider.isFetchingMore) {
                  pokemonProvider.fetchMorePokemon();
                }
                return true;
              },
              child: filteredPokemonList.isEmpty
                  ? const Center(
                      child: Text('No Pokémon found matching your search.'),
                    )
                  : ListView.builder(
                      itemCount: filteredPokemonList.length +
                          (pokemonProvider.isFetchingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == filteredPokemonList.length &&
                            pokemonProvider.isFetchingMore) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final pokemon = filteredPokemonList[index];
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
