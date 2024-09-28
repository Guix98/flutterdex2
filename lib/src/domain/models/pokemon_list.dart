import 'dart:convert';

import 'package:flutter_dex_2/src/common/domain/models/result.dart';

PokemonList pokemonListFromJson(String str) =>
    PokemonList.fromJson(json.decode(str));

String pokemonListToJson(PokemonList data) => json.encode(data.toJson());

class PokemonList {
  int count;
  String next;
  String previous;
  List<Result> results;

  PokemonList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  PokemonList copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<Result>? results,
  }) =>
      PokemonList(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
