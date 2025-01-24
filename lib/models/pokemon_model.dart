String capitalizeFirstLetter(String name) {
  if (name.isEmpty) return name;
  return name[0].toUpperCase() + name.substring(1);
}

List<String> capitalizeList(List<String> list) {
  if (list.isEmpty) return list;
  return list.map((item) => capitalizeFirstLetter(item)).toList();
}

class Pokemon {
  final String name;
  final String imageUrl;
  final String image2Url;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> pokedexEntries;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.image2Url,
    required this.height,
    required this.weight,
    required this.types,
    required this.pokedexEntries,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'] ?? '',
      image2Url: json['sprites']['other']['home']['front_default'] ?? '',
      height: json['height'],
      weight: json['weight'],
      types: capitalizeList((json['types'] as List)
          .map((typeInfo) => typeInfo['type']['name'] as String)
          .toList()),
      pokedexEntries: (json['flavor_text_entries'] as List)
          .where((entry) => entry['language']['name'] == 'en')
          .map((entry) => entry['flavor_text'] as String)
          .toList(),
    );
  }
}
