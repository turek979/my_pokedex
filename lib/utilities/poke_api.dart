import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_pokedex/models/pokemon_model.dart';

// Fetch individual Pokémon details
Future<Pokemon> fetchPokemon(String name) async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final speciesResponse = await http.get(Uri.parse(json['species']['url']));
    if (speciesResponse.statusCode == 200) {
      final speciesJson = jsonDecode(speciesResponse.body);
      json['flavor_text_entries'] = speciesJson['flavor_text_entries'];
    }
    return Pokemon.fromJson(json);
  } else {
    throw Exception('Failed to load Pokémon');
  }
}

// Fetch the list of Pokémon
Future<List<Map<String, dynamic>>> fetchPokemonListFromApi(
    {int limit = 1024, int offset = 0}) async {
  final url = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Raw API Response: $data'); // Debug print
    final results = data['results'] as List;

    return results
        .map((pokemon) => {
              "name": pokemon['name'],
              "url": pokemon['url'], // This contains the URL for details
            })
        .toList();
  } else {
    throw Exception('Failed to load Pokémon list');
  }
}
