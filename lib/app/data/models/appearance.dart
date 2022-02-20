class Appearance {
  String? gender;
  String? race;
  List<String>? height;
  List<String>? weight;
  String? eyeColor;
  String? hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
        gender: json['gender'],
        race: json['race'],
        height: List<String>.from(json['height'].map((dynamic x) => x)),
        weight: List<String>.from(json['weight'].map((dynamic x) => x)),
        eyeColor: json['eye-color'],
        hairColor: json['hair-color'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gender': gender,
        'race': race,
        'height': List<dynamic>.from(height!.map((String x) => x)),
        'weight': List<dynamic>.from(weight!.map((String x) => x)),
        'eye-color': eyeColor,
        'hair-color': hairColor,
      };
}
