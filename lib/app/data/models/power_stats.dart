class Powerstats {
  String? intelligence;
  String? strength;
  String? speed;
  String? durability;
  String? power;
  String? combat;

  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
        intelligence: json['intelligence'],
        strength: json['strength'],
        speed: json['speed'],
        durability: json['durability'],
        power: json['power'],
        combat: json['combat'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'intelligence': intelligence,
        'strength': strength,
        'speed': speed,
        'durability': durability,
        'power': power,
        'combat': combat,
      };
}
