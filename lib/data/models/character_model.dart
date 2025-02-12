class CharacterModel {
  final int id;
  final String name;
  final String statusIfAliveOrDead;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.statusIfAliveOrDead,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      statusIfAliveOrDead: json['status'] ?? 'Unknown',
      species: json['species'] ?? 'Unknown',
      type: json['type'] ?? '',
      gender: json['gender'] ?? 'Unknown',
      origin: Origin.fromJson(json['origin'] ?? {}),
      location: Location.fromJson(json['location'] ?? {}),
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': statusIfAliveOrDead,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toJson(),
      'location': location.toJson(),
      'image': image,
    };
  }
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'] ?? 'Unknown',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] ?? 'Unknown',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
