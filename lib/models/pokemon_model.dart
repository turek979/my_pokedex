String capitalizeFirstLetter(String name) {
  if (name.isEmpty) return name;
  return name[0].toUpperCase() + name.substring(1);
}

class Pokemon {
  final String name;
  final String imageUrl;
  final String image2Url;
  final int height;
  final int weight;
  final List<String> types;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.image2Url,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'] ?? '',
      image2Url: json['sprites']['other']['home']['front_default'] ?? '',
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((typeInfo) => typeInfo['type']['name'] as String)
          .toList(),
    );
  }
}
