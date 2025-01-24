import 'package:flutter/material.dart';
import 'package:my_pokedex/models/pokemon_model.dart';
import 'package:my_pokedex/utilities/poke_api.dart';

class PokemonProvider with ChangeNotifier {
  final List<Pokemon> _pokemonList = [];
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
          name: capitalizeFirstLetter(details.name),
          imageUrl: details.imageUrl,
          image2Url: details.image2Url,
          height: details.height,
          weight: details.weight,
          types: capitalizeList(details.types),
          pokedexEntries: details.pokedexEntries,
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

  /// Fetch more Pokémon for pagination
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
          name: capitalizeFirstLetter(details.name),
          imageUrl: details.imageUrl,
          image2Url: details.image2Url,
          height: details.height,
          weight: details.weight,
          types: capitalizeList(details.types),
          pokedexEntries: details.pokedexEntries,
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

  /// Search Pokémon by name
  Future<void> searchPokemonByName(String name) async {
    _isLoading = true;
    notifyListeners();

    try {
      final details = await fetchPokemon(name);
      final pokemon = Pokemon(
        name: capitalizeFirstLetter(details.name),
        imageUrl: details.imageUrl,
        image2Url: details.image2Url,
        height: details.height,
        weight: details.weight,
        types: capitalizeList(details.types),
        pokedexEntries: details.pokedexEntries,
      );

      _pokemonList.clear();
      _pokemonList.add(pokemon);
    } catch (e) {
      _errorMessage = 'Failed to search Pokémon: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
