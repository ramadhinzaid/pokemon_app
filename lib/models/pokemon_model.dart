import 'package:pokemon_app/models/moves_model.dart';
import 'package:pokemon_app/models/types_model.dart';

class PokemonModel {
  String? name, url, image;
  List<MovesModel>? moves;
  List<TypesModel>? types;
  PokemonModel({this.image, this.name, this.url, this.moves, this.types});

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        url: json["url"],
        image: json["image"],
        moves: List<MovesModel>.from(
            json["moves"].map((x) => MovesModel.fromJson(x))),
        types: List<TypesModel>.from(
            json["types"].map((x) => TypesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "image": image,
        "moves": List<dynamic>.from(moves!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class AllPokemonModel {
  String? nextUrl, prevUrl;
  List<PokemonModel>? listPokemon;
  AllPokemonModel({this.listPokemon, this.nextUrl, this.prevUrl});

  factory AllPokemonModel.fromJson(Map<String, dynamic> json) =>
      AllPokemonModel(
        nextUrl: json["nextUrl"],
        prevUrl: json["prevUrl"],
        listPokemon: json["listPokemon"],
      );
}

class PokebagModel {
  String? name;
  PokemonModel? pokemon;
  PokebagModel({this.pokemon, this.name});

  factory PokebagModel.fromJson(Map<String, dynamic> json) => PokebagModel(
        name: json["name"],
        pokemon: PokemonModel.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pokemon": pokemon?.toJson(),
      };
}
