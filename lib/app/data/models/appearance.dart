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
        gender: json["gender"],
        race: json["race"],
        height: List<String>.from(json["height"].map((x) => x)),
        weight: List<String>.from(json["weight"].map((x) => x)),
        eyeColor: json["eye-color"],
        hairColor: json["hair-color"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "race": race,
        "height": List<dynamic>.from(height!.map((x) => x)),
        "weight": List<dynamic>.from(weight!.map((x) => x)),
        "eye-color": eyeColor,
        "hair-color": hairColor,
      };
}
