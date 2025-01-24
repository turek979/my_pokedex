import 'dart:convert';
import 'package:http/http.dart' as http;

// Fetch individual Pokémon details
Future<Map<String, dynamic>> fetchPokemon(String name) async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load Pokémon');
  }
}

// Fetch the list of Pokémon
Future<List<Map<String, dynamic>>> fetchPokemonListFromApi(
    {int limit = 1025, int offset = 0}) async {
  final url = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final results = data['results'] as List;

    print('Fetched data: $results'); // Debug print
    return results.map((pokemon) {
      return {
        "name": pokemon['name'],
        "url": pokemon['url'],
      };
    }).toList();
  } else {
    throw Exception('Failed to load Pokémon list');
  }
}
