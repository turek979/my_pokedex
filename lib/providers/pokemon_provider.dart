import 'package:flutter/material.dart';
import 'package:my_pokedex/models/pokemon_model.dart';
import 'package:my_pokedex/utilities/poke_api.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _pokemonList = [];
  bool _isLoading = false;
  bool _isFetchingMore = false;
  String _errorMessage = '';
  int _offset = 0;
  final int _limit = 20;

  List<Pokemon> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;
  bool get isFetchingMore => _isFetchingMore;
  String get errorMessage => _errorMessage;

  /// Fetch the initial list of Pokémon
  Future<void> fetchPokemonList() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await fetchPokemonListFromApi(limit: _limit, offset: _offset);
      final fetchedPokemon =
          await Future.wait(response.map((pokemonJson) async {
        final details = await fetchPokemon(pokemonJson['name']);
        return Pokemon(
          name: capitalizeFirstLetter(details['name']),
          imageUrl: details['sprites']['front_default'] ?? '',
        );
      }));

      _pokemonList.addAll(fetchedPokemon);
      _offset += _limit;
    } catch (e) {
      _errorMessage = 'Failed to fetch Pokémon list: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch more Pokémon for infinite scrolling
  Future<void> fetchMorePokemon() async {
    if (_isFetchingMore) return;

    _isFetchingMore = true;
    notifyListeners();

    try {
      final response =
          await fetchPokemonListFromApi(limit: _limit, offset: _offset);
      final fetchedPokemon =
          await Future.wait(response.map((pokemonJson) async {
        final details = await fetchPokemon(pokemonJson['name']);
        return Pokemon(
          name: capitalizeFirstLetter(details['name']),
          imageUrl: details['sprites']['front_default'] ?? '',
        );
      }));

      _pokemonList.addAll(fetchedPokemon);
      _offset += _limit;
    } catch (e) {
      _errorMessage = 'Failed to fetch more Pokémon: $e';
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  /// Fetch a specific Pokémon by name for search functionality
  Future<void> searchPokemonByName(String name) async {
    if (_pokemonList
        .any((pokemon) => pokemon.name.toLowerCase() == name.toLowerCase())) {
      return; // Pokémon is already in the list
    }

    try {
      _isFetchingMore = true;
      notifyListeners();

      final response = await fetchPokemon(name.toLowerCase());
      final pokemon = Pokemon(
        name: capitalizeFirstLetter(response['name']),
        imageUrl: response['sprites']['front_default'] ?? '',
      );

      _pokemonList.add(pokemon);
    } catch (e) {
      print('Error searching Pokémon: $e');
      _errorMessage = 'Pokémon not found.';
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  /// Capitalize the first letter of a string
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
