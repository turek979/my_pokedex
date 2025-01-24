import 'package:flutter/material.dart';
import 'package:my_pokedex/screens/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_pokedex/providers/pokemon_provider.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  String _searchQuery = ''; // Current search query
  bool _isSearching = false; // To track ongoing search
  late PokemonProvider _pokemonProvider;

  @override
  void initState() {
    super.initState();
    _pokemonProvider = Provider.of<PokemonProvider>(context, listen: false);
    _pokemonProvider.fetchPokemonList(); // Fetch Pokémon on screen load
  }

  void _handleSearch(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = true; // Start search
    });

    // Filter Pokémon list based on search query
    final filteredPokemonList = _pokemonProvider.pokemonList
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filteredPokemonList.isEmpty) {
      _pokemonProvider.searchPokemonByName(query).then((_) {
        setState(() {
          _isSearching = false; // End search
        });
      });
    } else {
      setState(() {
        _isSearching = false; // End search
      });
    }
  }

  void _clearSearch() {
    setState(() {
      _searchQuery = '';
      _isSearching = false;
    });
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
              onChanged: _handleSearch,
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
              child: _isSearching
                  ? const Center(child: CircularProgressIndicator())
                  : filteredPokemonList.isEmpty
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
                            return SizedBox(
                              child: ListTile(
                                leading: Image.network(pokemon.imageUrl),
                                title: Text(
                                  pokemon.name,
                                  style: TextStyle(fontSize: 20),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PokemonDetailScreen(
                                        pokemon: pokemon,
                                        searchQuery: _searchQuery,
                                        onBack: _clearSearch,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
            ),
    );
  }
}
