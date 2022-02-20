class Biography {
  String? fullName;
  String? alterEgos;
  List<String>? aliases;
  String? placeOfBirth;
  String? firstAppearance;
  String? publisher;
  String? alignment;

  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
        fullName: json['full-name'],
        alterEgos: json['alter-egos'],
        aliases: List<String>.from(json['aliases'].map((dynamic x) => x)),
        placeOfBirth: json['place-of-birth'],
        firstAppearance: json['first-appearance'],
        publisher: json['publisher'],
        alignment: json['alignment'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'full-name': fullName,
        'alter-egos': alterEgos,
        'aliases': List<dynamic>.from(aliases!.map((dynamic x) => x)),
        'place-of-birth': placeOfBirth,
        'first-appearance': firstAppearance,
        'publisher': publisher,
        'alignment': alignment,
      };
}
