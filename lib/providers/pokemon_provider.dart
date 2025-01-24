import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_pokedex/models/pokemon_model.dart';
import 'package:my_pokedex/utilities/poke_api.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _pokemonList = [];
  int _offset = 0; // Track the current offset for pagination
  final int _limit = 50; // Number of Pokémon to fetch per page
  bool _isLoading = false; // Track if the initial loading is in progress
  bool _isFetchingMore = false; // Track if more data is being fetched
  String? _errorMessage; // Store error messages if any

  List<Pokemon> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;
  bool get isFetchingMore => _isFetchingMore;
  String? get errorMessage => _errorMessage;

  /// Fetch the initial Pokémon list or refresh the list
  Future<void> fetchPokemonList() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response =
          await fetchPokemonListFromApi(limit: _limit, offset: _offset);
      _offset += _limit;

      final futures = response.map((item) async {
        try {
          final detailResponse = await http.get(Uri.parse(item['url']));
          if (detailResponse.statusCode == 200) {
            final details = jsonDecode(detailResponse.body);
            return Pokemon(
              name: capitalizeFirstLetter(details['name']),
              imageUrl: details['sprites']['front_default'] ?? '',
            );
          } else {
            print('Failed to fetch details for ${item['name']}');
            return null;
          }
        } catch (e) {
          print('Error fetching details for ${item['name']}: $e');
          return null;
        }
      });

      _pokemonList = (await Future.wait(futures))
          .whereType<Pokemon>() // Filter out null values
          .toList();
    } catch (e) {
      _errorMessage = 'Failed to load Pokémon list. Please try again later.';
      print('Error fetching Pokémon list: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch more Pokémon for pagination
  Future<void> fetchMorePokemon() async {
    if (_isFetchingMore) return; // Prevent duplicate calls
    _isFetchingMore = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response =
          await fetchPokemonListFromApi(limit: _limit, offset: _offset);
      _offset += _limit;

      final futures = response.map((item) async {
        try {
          final detailResponse = await http.get(Uri.parse(item['url']));
          if (detailResponse.statusCode == 200) {
            final details = jsonDecode(detailResponse.body);
            return Pokemon(
              name: capitalizeFirstLetter(details['name']),
              imageUrl: details['sprites']['front_default'] ?? '',
            );
          } else {
            print('Failed to fetch details for ${item['name']}');
            return null;
          }
        } catch (e) {
          print('Error fetching details for ${item['name']}: $e');
          return null;
        }
      });

      final fetchedPokemon = (await Future.wait(futures))
          .whereType<Pokemon>() // Filter out null values
          .toList();
      _pokemonList.addAll(fetchedPokemon);
    } catch (e) {
      _errorMessage = 'Failed to load more Pokémon. Please try again later.';
      print('Error fetching more Pokémon: $e');
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }
}

/// Helper function to capitalize the first letter of a string
String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}
