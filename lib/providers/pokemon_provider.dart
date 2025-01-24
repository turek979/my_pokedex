import 'package:flutter/material.dart';
import 'package:my_pokedex/models/pokemon_model.dart';
import 'package:my_pokedex/utilities/poke_api.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _pokemonList = [];
  bool _isLoading = false;

  List<Pokemon> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemonList() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await fetchPokemonListFromApi(); // Fetch list logic
      _pokemonList = response
          .map((json) => Pokemon.fromJson(json))
          .toList(); // Map API data to Pokemon model
    } catch (e) {
      print('Error fetching Pokémon: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
