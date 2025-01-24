String capitalizeFirstLetter(String name) {
  if (name.isEmpty) return name;
  return name[0].toUpperCase() + name.substring(1);
}

class Pokemon {
  final String name;
  final String imageUrl;
  final String image2Url;

  Pokemon({required this.name, required this.imageUrl, required this.image2Url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // Debug print
    // print('Mapping Pokémon: $json');
    // print('Parsed Pokémon: name=${json['name']}, imageUrl=$imageUrl');

    final imageUrl = json['sprites']?['front_default'] ?? '';
    final image2Url =
        json['sprites']?['other']?['home']?['front_default'] ?? '';

    return Pokemon(
      name: capitalizeFirstLetter(json['name']),
      imageUrl: imageUrl, // Handle missing image
      image2Url: image2Url,
    );
  }
}
