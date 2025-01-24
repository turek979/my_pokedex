String capitalizeFirstLetter(String name) {
  if (name.isEmpty) return name;
  return name[0].toUpperCase() + name.substring(1);
}

class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({required this.name, required this.imageUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // Debug print
    // print('Mapping Pokémon: $json');
    // print('Parsed Pokémon: name=${json['name']}, imageUrl=$imageUrl');

    final imageUrl = json['sprites']?['front_default'] ?? '';

    return Pokemon(
      name: capitalizeFirstLetter(json['name']),
      imageUrl: imageUrl, // Handle missing image
    );
  }
}
