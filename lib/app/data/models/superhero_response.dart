import 'package:superhero/app/data/models/appearance.dart';
import 'package:superhero/app/data/models/biography.dart';
import 'package:superhero/app/data/models/connections.dart';
import 'package:superhero/app/data/models/image.dart';
import 'package:superhero/app/data/models/power_stats.dart';
import 'package:superhero/app/data/models/work.dart';

class SuperheroResponse {
  String? response;
  String? id;
  String? name;
  Powerstats? powerstats;
  Biography? biography;
  Appearance? appearance;
  Work? work;
  Connections? connections;
  ImageResponse? image;

  SuperheroResponse({
    this.response,
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.appearance,
    this.work,
    this.connections,
    this.image,
  });

  factory SuperheroResponse.fromJson(Map<String, dynamic> json) =>
      SuperheroResponse(
        response: json['response'],
        id: json['id'],
        name: json['name'],
        powerstats: Powerstats.fromJson(json['powerstats']),
        biography: Biography.fromJson(json['biography']),
        appearance: Appearance.fromJson(json['appearance']),
        work: Work.fromJson(json['work']),
        connections: Connections.fromJson(json['connections']),
        image: ImageResponse.fromJson(json['image']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'response': response,
        'id': id,
        'name': name,
        'powerstats': powerstats!.toJson(),
        'biography': biography!.toJson(),
        'appearance': appearance!.toJson(),
        'work': work!.toJson(),
        'connections': connections!.toJson(),
        'image': image!.toJson(),
      };
}
